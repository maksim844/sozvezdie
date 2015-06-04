module ApplicationHelper
  def main_menu(action)
    main_menu = Section.where(allowapplication: 1)
    result = ''
    main_menu.each do |m|
      result += content_tag(:li, link_to(m.title, welcome_show_path(m.uri), style: "background-image: url(#{m.image.url})"))
    end
    return result.html_safe
  end


  def left_menu(section)
    node_id = Node.find_by_url(section + '/').id
    left_menu = Node.where("in_site_map = 1 and ancestry = '#{node_id}'")
    .order('case when nodes.ancestry is null then 0 else 1 end')
    .order(:ancestry).order(:position)

    result = ''
    left_menu.each do |m|
      if url_check_class?(m.url) || url_child_class?(m.url)
        result += content_tag(:li, '<span class="bo"><span class="bl"></span><span class="bm"></span><span class="br"></span>'.html_safe + link_to(m.name2, node_path(m.url), class: :active))
      else
        url = m.the_link_to.empty? ? m.url : m.the_link_to
        result += content_tag(:li, link_to(m.name2, get_path_by_url(url, section)))
      end

      sub_nodes = Node.where("in_site_map = 1 and ancestry like '%#{m.id}'")
      @sub_menu = Hash.new
      @sub_menu[m.url] = sub_nodes.map(&:url)
    end

    return result.html_safe
  end

  def sub_menu

  end

  def url_check_class?(url)
    request.fullpath.include?(url[0..url.length-2])
  end

  def url_child_class?(url)
    parent_id = Node.find_by_url(url).id
    childs = Node.where("ancestry like '%#{parent_id}'")
    i = 0
    childs.each do |c|
      i+=1 if request.fullpath.include?(c.url[0..c.url.length-2])
    end
    return i > 0
  end

  def get_path_by_url(url, section)
    type = Node.find_by_url(url).content_producer
    case type
      when 'Teachers'
        teacher_path(section)
      when 'PhotoRep'
        picturealbum_path(section)
      when 'Stat'
        article_path(section)
      when 'Guest'
        guest_path(section)
      when 'News'
        news_path(section)
      else
        node_path(url)

    end
  end

  def section_attr(section)
    title = Section.find_by_uri(section).title
    result = ''
    case section
      when 'design'
        result += "<div class='#{section}'>"
        result += "<p>#{title}</p>"
        result += "</div>"
        result += "<span id='icon10'></span>"
        result += "<span id='icon11'></span>"
        result += "<a id='master' href='/nodes/design/page424/'></a>"
      else
        result += "<div class='#{section}'>"
        result += "<p>#{title}</p>"
        result += "</div>"
    end
    result.html_safe
  end

  def section_name(section)
    Section.find_by_uri(section).title
  end

  def gallery(section)
    section_id = Section.find_by_uri(section).id
    return Photomain.where(setting_id: section_id)
  end
end
