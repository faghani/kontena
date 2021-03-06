V1::ServicesApi.route('service_stats') do |r|

  # GET /v1/services/:grid_name/:service_name/stats
  r.get do
    r.is do
      sort = r.params["sort"] ? r.params["sort"] : "cpu"
      limit = r.params["limit"] ? r.params["limit"].to_i : nil

      @stats = Metrics.get_container_stats(@grid_service.containers, sort.to_sym, limit)
      render('stats/stats')
    end
  end
end
