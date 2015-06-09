#require 'dragonfly/rails/images'

RailsAdmin.config do |config|
  config.excluded_models = [RelTest]
  #config.authenticate_with {}
  #config.current_user_method { current_user }
  config.authorize_with :cancan
  config.audit_with :history, User
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)
  config.main_app_name = ['Sozvezdie Ieml', 'Admin']
  config.included_models = ['News', 'Section', 'Node', 'Teacher', 'Setting', 'Album', 'Photo', 'Article', 'Photomain', 'User']
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
  config.navigation_static_label = "Управление меню"
  config.navigation_static_links = {
      'Расположение меню' => '/admin/node/nestable'
  }
  config.model User do
    field :email
    field :password
    field :password_confirmation
    field :avatar
    field :is_admin
    field :roles
  end
  config.model Article do
    navigation_label "Контент сайта"

    field :node do
      associated_collection_scope do
        Proc.new { |scope|
          scope = scope.where("content_producer = 'Stat'")
        }
        #partial :node_articles_partial
      end
    end
    field :name
    field :date#, :rich_picker
    field :anons, :rich_editor
    field :text, :rich_editor
    field :image
  end
  config.model Album do
    navigation_label "Албомы и фотографии"

    field :node do
      associated_collection_scope do
        Proc.new { |scope|
          scope = scope.where("content_producer = 'PhotoRep'")
        }
      end
      end
    field :name
    field :photo#, :rich_picker
    field :photos#, :rich_picker
  end
  config.model Photo do
    navigation_label "Албомы и фотографии"
    field :album
    field :name
    field :photo#, :rich_picker
    field :comment
  end
  config.model Photomain do
    navigation_label "Албомы и фотографии"
    field :setting
    field :name
    field :image#, :rich_picker
  end

  config.model Section do
    navigation_label "Разделы сайта"
    field :title

    field :image
    field :uri
    field :email
    field :yandex, :rich_editor
    field :footerinfo, :rich_editor

  end

  config.model Setting do
    parent Section
    field :id do
      read_only false
    end
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
    navigation_label "Контент сайта"

    field :node do
      associated_collection_scope do
        Proc.new { |scope|
          scope = scope.where("content_producer = 'Teachers'")
        }
      end
    end
    field :name
    field :post
    field :anons, :rich_editor
    field :text, :rich_editor
    field :photo
  end

  config.model Node do
    navigation_label "Контент сайта"

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
    navigation_label "Контент сайта"

    field :node do
        associated_collection_scope do
          Proc.new { |scope|
            scope = scope.where("content_producer = 'News'")
          }
        end

      end
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

