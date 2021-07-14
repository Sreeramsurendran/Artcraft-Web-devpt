from flask import *
import pymysql
import smtplib

app = Flask(__name__)
con = pymysql.connect(host='localhost', port=3306, user='root', password='', db='bootstrap')
cmd = con.cursor()

app.secret_key = "qwertyu"


# login
@app.route('/')
def main():
    return render_template('login.html')


@app.route('/login', methods=['post'])
def login():
    mail = request.form['mail']
    pass1 = request.form['pass']
    cmd.execute("select * from login_details where email='" + mail + "' and pass1='" + pass1 + "'")
    s = cmd.fetchone()
    if s is None:
        return '''<script>alert("Invalid Login!Please check your user name & password");window,location='/'</script>'''
    else:
        session['lid']=str(s[0])
        return '''<script>alert("Login Successful!");window,location='/index'</script>'''


# new user
@app.route('/sign')
def sign():
    return render_template('signup.html')


@app.route('/reg', methods=['post'])
def reg():
    fname = request.form['fname']
    lname = request.form['lname']
    mail = request.form['mail']
    pass1 = request.form['pass1']
    pass2 = request.form['pass2']
    if (pass1 == pass2):
        cmd.execute(
            "insert into login_details values(NULL,'" + fname + "','" + lname + "','" + mail + "','" + pass1 + "','" + pass2 + "')")
        k = con.insert_id()
        con.commit()
        return '''<script>alert("Account created Successfully!");window,location='/'</script>'''
    else:
        return '''<script>alert("Password mismatch!");window,location='/sign'</script>'''


# front page
@app.route('/index')
def index():
    return render_template('/index.html')


#shopping page
@app.route('/shoppingpage')
def shoppingpage():
    cmd.execute("select name, price from products")
    result=cmd.fetchall()
    return render_template('/shoppingpage.html', result=result)
@app.route('/shopmethod',methods=['post','get'])
def shopmethod():
    cmd.execute("select login_id from login_details")
    s=cmd.fetchone()

    cmd.execute("select name,price from products")
    k=cmd.fetchone()
    session['lid']=str(s[0])
    lid=session['lid']
    cmd.execute("insert into checkout_details values(NULL,'"+str(k[0])+"','"+str(k[1])+"','"+str(lid)+"')")
    con.commit()
    return '''<script>alert("Product added to cart");window,location='/checkout'</script>'''

#payment
@app.route('/payment')
def payment():
    cmd.execute("select product_name,product_price from checkout_details")
    k=cmd.fetchone()
    return render_template('payment.html',k=k)

#checkout
@app.route('/checkout')
def checkout():
    return render_template('/checkout.html')

#shipping details
@app.route('/shipping',methods=['post'])
def shipping():
    fullname=request.form['fullname']
    hname=request.form['hname']
    city=request.form['city']
    state=request.form['state']
    zipp=request.form['zip']
    namecard=request.form['namecard']
    cardno=request.form['cardno']
    exp=request.form['exp']
    cvv=request.form['cvv']
    cmd.execute("insert into per_det values(null,'"+fullname+"','"+hname+"','"+city+"','"+state+"','"+zipp+"','"+namecard+"','"+cardno+"','"+exp+"','"+cvv+"','"+str(session['lid'])+"')")
    con.commit()
    return '''<script>alert("Shipping details added!");window,location='/payment'</script>'''

@app.route('/proceed')
def proceed():
    return '''<script>alert("Order Placed");window,location='/shoppingpage'</script>'''



app.run(debug=True)
