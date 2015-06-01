require 'dragonfly/rails/images'

RailsAdmin.config do |c|
  c.excluded_models = [RelTest]
  c.authenticate_with {}
  c.current_user_method { current_user }
  c.authorize_with :cancan
  c.audit_with :history, User
end

RailsAdmin.config do |config|
  config.included_models = ['News', 'Section', 'Node', 'Teacher', 'Setting', 'Album', 'Photo', 'Article']
  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions
    index                         # mandatory
    new
    #export
    #history_index
    bulk_delete
    # member actions
    show
    edit
    delete
    #history_show
    show_in_app

    nestable
  end

  config.model Article do
    field :node
    field :name
    field :date#, :rich_picker
    field :anons, :rich_editor
    field :text, :rich_editor
    field :image
  end
  config.model Album do
    field :node
    field :name
    field :photo#, :rich_picker
    field :photos#, :rich_picker
  end
  config.model Photo do
    field :album
    field :name
    field :photo#, :rich_picker
    field :comment
  end

  config.model Section do
    field :title

    field :image
    field :uri
    field :email
    field :yandex, :rich_editor
    field :footerinfo, :rich_editor

  end

  config.model Setting do
    field :section
    field :name
    field :adminEmail
    field :countnews
    field :mainnews
    field :about, :rich_editor
    field :contheader, :rich_editor
    field :telheader, :rich_editor
    field :footerinfo, :rich_editor
    field :footercont, :rich_editor
    field :fonmus
    field :photomains
  end

  config.model Teacher do
    field :section
    field :name
    field :post
    field :anons, :rich_editor
    field :text, :rich_editor
    field :photo
  end

  config.model Node do
    nestable_tree({
                      position_field: :position,
                      max_depth: 6
                  })

    field :name do
      read_only false
    end
    field :url do
      read_only false
    end
    field :content, :rich_editor do
      read_only false
    end
    field :keywords do
      read_only false
    end
    field :description do
      read_only false
    end

  end
  config.model News do
      field :id
      field :node
      field :date
      field :name
      field :anons, :rich_editor
      field :text, :rich_editor
       field :image do
         formatted_value do
           bindings[:view].tag(:img, { :src => bindings[:object].image.url, style: 'width: 50px' }) << value
         end
       end


  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
        # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

       list do
          #filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
          items_per_page 20    # Override default_items_per_page
          sort_by :id           # Sort column (default is primary key)
          sort_reverse true     # Sort direction (default is true for primary key, last created first)
       end
       show do; end
       edit do; end
       export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
   end
end

