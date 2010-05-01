# Experiment with the vpim gem for working with vcards.
require 'rubygems'
require 'vpim'

filename = ARGV.first or raise "you must specify a vcard file"
vcard = Vpim::Vcard.decode(open(filename)).first
puts vcard.name.fullname
puts vcard.title if vcard.title
puts vcard.org
puts vcard.emails
puts vcard.telephones

File.open("#{vcard.name.fullname}.vcf", 'w') { |f| f.write(vcard.encode) }
