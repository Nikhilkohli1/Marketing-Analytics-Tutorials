import pydbgen
from pydbgen import pydbgen

myDB = pydbgen.pydb()

testdf = myDB.gen_dataframe(5,fields=['name','city','license_plate','email'
],real_email=False,phone_simple=True)
print(testdf)