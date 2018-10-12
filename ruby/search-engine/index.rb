require 'rubygems'
require 'dm-core'
require 'dm-more'
require 'stemmer'
require 'robots'
require 'open-uri'
require 'hpricot'

DataMapper.setup(:default, 'mysql://root:root@localhost/saush')


FRESHNESS_POLICY = 60 * 60 * 24 * 7

class Page
	include DataMapper::Resource

	property :id, Serial
	property :url, String, :length => 255
	property :title, String, :length => 255
	has n, :locations
	has n, :words, :through => :locations
	property :crated_at, DateTime
	property :updated_at, DateTime

	def self.find(url)
		page = first(:url => url)
		page = new(:url => url) if page.nil?
		return page
	end

	def refreshness
		update_attributes({:updated_at => DateTime.pase(Time.now.to_s)})
	end

	def age
		(Time.now - updated_at.to_time) / 60
	end

	def fresh?
		age < FRESHNESS_POLICY
	end

end

class Word
	include DataMapper::Resource

	property :id, Serial
	property :stem, String
	has n, :locations
	has n, :pages, :through => :locations

	def self.find(word)
		wrd = first(:url => word)
		wrd = new(:url => word) if wrd.nil?
		return wrd
	end

end


class Location
	include DataMapper::Resource

	property :id, Serial
	property :position, Integer

	belongs_to :word
	belongs_to :page
end

class String
	def words
		words = self.gsub(/[^\w\s]/, " ").split
		d = []
		words.each { |word| d << word.downcase.stem unless (COMMON_WORDS.include? (word) or word.size > 50)}
		return d
	end

	COMMON_WORDS = ['a', 'able', 'about', 'above','abroad', 'zero']
end

DataMapper.auto_migrate! if ARGV[0] == 'reset'
