module Songkickr
  class Remote
    include HTTParty
    base_uri 'api.songkick.com/api/3.0/'
    format :json
    
    attr_reader :api_key
    
    # Get your api_key found here http://developer.songkick.com
    def initialize(api_key = nil)
      @api_key = api_key
      @api_key ||= Songkickr.api_key
      
      @api_path = ''
    end
    
    def events(query={})
      self.class.get('/events', :query => query['searchResults'].rubyify_keys!)
    end
    
    
    # # Use this resource to search Billboard data for chart items by 
    #     # id, by date, by artist, or by song.
    #     #
    #     # Parameters:
    #     # 
    #     #     id          string(optional)  Chart spec(format) id - this can be retrieved by spec service
    #     #     start_date  string(optional)  Chart issue date range start
    #     #     end_date    string(optional)  Chart issue date range end
    #     #     artist      string(optional)  Artist name to search
    #     #     song        string(optional)  Song name to search
    #     #
    #     #     start       default: 1              Start position of raw ResultSet
    #     #     count       default: 50             number of data might be returned. Maximum 50
    #     #     sort        default: date-, name+   Sort order desired, with "+" or "-" suffix to indicate ascending or descending. For example, date+
    #     #
    #     def search(query={})
    #       results = Mash.new(self.class.get('/list', :query => scrub_query(query))['searchResults']).rubyify_keys!
    #       results.chart_items = results.delete('chart_item')
    #       results.chart_items = [] if results.chart_items.nil?
    #       results
    #     end
    #     
    #     
    #     # Get chart data based on chart ID
    #     #
    #     # Parameters
    #     #
    #     #     id  String
    #     #
    #     def chart(id, query={})
    #       chart = Mash.new(self.class.get('/item', :query => {:id => id}.merge(query).merge(self.default_options))).chart
    #       chart.rubyify_keys!
    #       chart.chart_items.items = chart.chart_items.delete('chart_item')
    #       chart
    #     end
    #     
    #     # This resource returns data on the different chart names 
    #     # and chart types. 
    #     #
    #     # The API orders the results ascending by ChartSpecId.
    #     #
    #     # Parameters
    #     #
    #     #     name   string(optional)  chart name, for example: The Billboard Hot 100
    #     #     type   string(optional)  chart type, for example: Singles
    #     #
    #     def chart_specs(query={})
    #       results = Mash.new(self.class.get('/list/spec', :query => query.merge(self.default_options))['chartSpecs'])
    #       results.rubyify_keys!
    #       results.charts = results.delete('chart_spec')
    #       results
    #     end
    
    protected
    
      def default_options
        {:api_key => @api_key, :format => 'json'}
      end
      
      def scrub_query(query)
        query[:sdate] = query[:start_date] unless query[:start_date].blank?
        query[:edate] = query[:end_date] unless query[:end_date].blank?
        query[:sort] = query[:sort].gsub('+', ' ') unless query[:sort].blank?
        query.merge(self.default_options)
      end
    
  end
end