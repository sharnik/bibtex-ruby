require File.expand_path('../../lib/bibtex.rb', __FILE__)
require 'rubygems'
require 'minitest/unit'
require 'minitest/autorun'
require 'yaml'

class TestString < MiniTest::Unit::TestCase
  
  def setup
  end

  def teardown
  end

  def test_yaml
    bib = BibTeX::Bibliography.open('test/bib/10_bibdesk.bib', :debug => true)
    yaml = YAML.load(bib.to_yaml)
    refute_nil(yaml)
    assert_equal(3, yaml.length)
    assert_equal(['dragon', 'pickaxe', 'rails'], yaml.map { |y| y['key'] }.sort)
    assert_equal('{The Facets of Ruby}', yaml[0]['series'])
  end
end