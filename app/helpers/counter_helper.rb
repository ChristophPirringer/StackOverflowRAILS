module CounterHelper
  def post_number_counter(posts)
    from = Post.order(["created_at ASC"]).last.created_at

    to   = DateTime.now.in_time_zone(Time.zone).end_of_day

    ppd = posts.where(created_at: from .. to)
    binding.pry
    ppd.group('date(created_at)')
    # posts.group('date(created_at)').where(created_at: from .. to)
  end
end
