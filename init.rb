#TO get the current directory
APP_ROOT = File.dirname(__FILE__)

#This instruction searches class files in the given folder
$:.unshift(File.join(APP_ROOT, 'lib'))

require 'interface'

interface = Interface.new('movieee.txt')

interface.launch!