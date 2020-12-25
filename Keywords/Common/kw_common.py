from robot.libraries.BuiltIn import BuiltIn
from robot.api.deco import keyword
import datetime
# import time
# from selenium.webdriver.common.action_chains import ActionChains
# from selenium import webdriver
# from pynput.keyboard import Key, Controller
# import clipboard
import pickle
from robot.api.deco import keyword
import time
import datetime

#try
@keyword('Get_value_by_javascript')
def getValueByJavascript(locator):
 driver = BuiltIn().get_library_instance('SeleniumLibrary').driver
 obj = driver.find_element_by_css_selector("locator")

 #GET RETURN VALUE
 driver.execute_script('return arguments[0].value;', obj)
 txt = obj.get_attribute('value')
 return txt

@keyword('Click_by_javascript')
def clickByJavascript(locator):
 driver = BuiltIn().get_library_instance('SeleniumLibrary').driver
 obj = driver.find_element_by_xpath(locator)
 driver.execute_script('arguments[0].click()', obj)

@keyword('Dump_Variable_To_File')
def dumpVariable(arg,filename):
 fileObject = open(filename, 'wb')

 # Write object to file
 pickle.dump(arg, fileObject)

 fileObject.close()

@keyword('Load_Variable_From_File')
def loadVariable(filename):
 # open the file for reading
 fileObject = open(filename, 'rb')

 # Load object from file
 arg = pickle.load(fileObject)

 return arg



