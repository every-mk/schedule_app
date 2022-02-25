module PostsHelper
  def all_day?(all_day)
    if all_day
      return "○"
    end
  end

  def link_to_posts(link_name)
    link_to link_name, :posts
  end

  def link_to_post_new(link_name)
    link_to link_name, :new_post
  end

  def link_to_post_show(link_name, post)
    link_to link_name, post
  end

  def link_to_post_edit(link_name, post)
    link_to link_name, [:edit, post]
  end

  def link_to_post_destroy(link_name, post)
    link_to link_name, post, data: { turbo_method: :delete, turbo_confirm: "本当に削除しますか？" }
  end
end
