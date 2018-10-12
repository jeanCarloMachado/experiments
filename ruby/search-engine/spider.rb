require 'rubygems'
require 'index'


LAST_CRAWLED_PAGES = 'seed.yml'
DO_NOT_CRAWL_TYPES = %w(.pdf .doc .xls .ppt .mp3 .m4v .avi .mpg .rss .xml .json .txt .git .zip .md5 .asc .jpg .gif .png)
USER_AGENT = 'saush-spider'


class Spider
	def start
		Hpricot.buffer_size = 204800
		process(YAML.load_file(LAST_CRAWLED_PAGES))
	end

	def process(pages)
		robot = Robots.new USER_AGENT
		until pages.nil? or pages.empty?
	end
end

