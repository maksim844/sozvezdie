# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150524161504) do

  create_table "_answer", :primary_key => "__DocID", :force => true do |t|
    t.integer "__ParentDocID",                 :null => false
    t.string  "name"
    t.string  "count",         :default => ""
  end

  add_index "_answer", ["__DocID"], :name => "idx___DocID"
  add_index "_answer", ["__ParentDocID"], :name => "idx___ParentDocID"

  create_table "_comment", :primary_key => "__DocID", :force => true do |t|
    t.integer "__ParentDocID",                    :null => false
    t.string  "name"
    t.text    "comment"
    t.date    "date"
    t.boolean "publish",       :default => false
  end

  add_index "_comment", ["__DocID"], :name => "idx___DocID"
  add_index "_comment", ["__ParentDocID"], :name => "idx___ParentDocID"

  create_table "_dict", :primary_key => "__DocID", :force => true do |t|
    t.integer "__ParentDocID",                 :null => false
    t.string  "name",          :default => ""
  end

  add_index "_dict", ["__DocID"], :name => "idx___DocID"
  add_index "_dict", ["__ParentDocID"], :name => "idx___ParentDocID"

  create_table "_guest", :primary_key => "__DocID", :force => true do |t|
    t.integer "__ParentDocID",                    :null => false
    t.string  "name"
    t.string  "phone",         :default => ""
    t.text    "text"
    t.string  "email",         :default => ""
    t.boolean "publish",       :default => false
    t.date    "date"
    t.text    "reply"
  end

  add_index "_guest", ["__DocID"], :name => "idx___DocID"
  add_index "_guest", ["__ParentDocID"], :name => "idx___ParentDocID"

  create_table "_interesting", :primary_key => "__DocID", :force => true do |t|
    t.integer "__ParentDocID",                    :null => false
    t.string  "name"
    t.text    "text"
    t.boolean "publish",       :default => false
  end

  add_index "_interesting", ["__DocID"], :name => "idx___DocID"
  add_index "_interesting", ["__ParentDocID"], :name => "idx___ParentDocID"

  create_table "_licenses", :primary_key => "__DocID", :force => true do |t|
    t.integer "__ParentDocID", :null => false
    t.string  "name"
    t.string  "img"
  end

  add_index "_licenses", ["__DocID"], :name => "idx___DocID"
  add_index "_licenses", ["__ParentDocID"], :name => "idx___ParentDocID"

  create_table "_manuals", :primary_key => "__DocID", :force => true do |t|
    t.integer "__ParentDocID",                 :null => false
    t.string  "name"
    t.string  "photo"
    t.string  "author",        :default => ""
    t.date    "date"
    t.text    "descr"
    t.string  "file"
  end

  add_index "_manuals", ["__DocID"], :name => "idx___DocID"
  add_index "_manuals", ["__ParentDocID"], :name => "idx___ParentDocID"

  create_table "_opros", :primary_key => "__DocID", :force => true do |t|
    t.integer "__ParentDocID",                    :null => false
    t.string  "name"
    t.boolean "active",        :default => false
  end

  add_index "_opros", ["__DocID"], :name => "idx___DocID"
  add_index "_opros", ["__ParentDocID"], :name => "idx___ParentDocID"

  create_table "_sitetype", :primary_key => "__DocID", :force => true do |t|
    t.integer "__ParentDocID",                 :null => false
    t.string  "name"
    t.string  "code",          :default => ""
  end

  add_index "_sitetype", ["__DocID"], :name => "idx___DocID"
  add_index "_sitetype", ["__ParentDocID"], :name => "idx___ParentDocID"

  create_table "_subdepartment", :primary_key => "__DocID", :force => true do |t|
    t.integer "__ParentDocID", :null => false
    t.string  "name"
  end

  add_index "_subdepartment", ["__DocID"], :name => "idx___DocID"
  add_index "_subdepartment", ["__ParentDocID"], :name => "idx___ParentDocID"

  create_table "_subscribe", :primary_key => "__DocID", :force => true do |t|
    t.integer "__ParentDocID", :null => false
    t.string  "name"
  end

  add_index "_subscribe", ["__DocID"], :name => "idx___DocID"
  add_index "_subscribe", ["__ParentDocID"], :name => "idx___ParentDocID"

  create_table "_video", :primary_key => "__DocID", :force => true do |t|
    t.integer "__ParentDocID", :null => false
    t.string  "name"
    t.string  "photo"
    t.text    "text"
  end

  add_index "_video", ["__DocID"], :name => "idx___DocID"
  add_index "_video", ["__ParentDocID"], :name => "idx___ParentDocID"

  create_table "albums", :force => true do |t|
    t.integer  "node_id",            :null => false
    t.string   "name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "albums", ["id"], :name => "idx___DocID"

  create_table "articles", :force => true do |t|
    t.integer  "node_id",            :null => false
    t.string   "name"
    t.date     "date"
    t.text     "anons"
    t.text     "text"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "articles", ["id"], :name => "idx___DocID"
  add_index "articles", ["node_id"], :name => "idx___ParentDocID"

  create_table "balls", :force => true do |t|
    t.string   "color"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bs_banner", :primary_key => "BannerID", :force => true do |t|
    t.string   "Name",                         :default => "", :null => false
    t.text     "FileName",                                     :null => false
    t.string   "URL",                          :default => "", :null => false
    t.integer  "Probability",    :limit => 2,  :default => 0,  :null => false
    t.integer  "Status",         :limit => 2,  :default => 0,  :null => false
    t.integer  "MaxShow",                      :default => 0,  :null => false
    t.integer  "ShowCount",                    :default => 0,  :null => false
    t.integer  "ClickCount",                   :default => 0,  :null => false
    t.integer  "FK",                           :default => 0,  :null => false
    t.datetime "StartShow",                                    :null => false
    t.datetime "StopShow",                                     :null => false
    t.integer  "Type",           :limit => 1,  :default => 0,  :null => false
    t.integer  "LogEnable",      :limit => 1,  :default => 0,  :null => false
    t.string   "PageShown",      :limit => 50, :default => "", :null => false
    t.integer  "ClientID",                     :default => 0,  :null => false
    t.integer  "RichMedia",      :limit => 1,  :default => 0,  :null => false
    t.string   "AltText",                      :default => "", :null => false
    t.integer  "ShowCategoryID",               :default => 0,  :null => false
    t.integer  "ShowType",                     :default => 0,  :null => false
  end

  add_index "bs_banner", ["BannerID"], :name => "BannerID"

  create_table "bs_banner_log", :id => false, :force => true do |t|
    t.integer  "BannerID",                :default => 0,  :null => false
    t.datetime "ActionTime",                              :null => false
    t.integer  "ActionType", :limit => 1, :default => 0,  :null => false
    t.string   "Reference",               :default => "", :null => false
    t.integer  "VisitorIP",               :default => 0,  :null => false
  end

  add_index "bs_banner_log", ["BannerID"], :name => "BannerID"

  create_table "chatban", :primary_key => "banid", :force => true do |t|
    t.datetime "dtmcreated"
    t.datetime "dtmtill"
    t.string   "address"
    t.string   "comment"
    t.integer  "blockedCount", :default => 0
  end

  create_table "chatconfig", :force => true do |t|
    t.string "vckey"
    t.string "vcvalue"
  end

  create_table "chatgroup", :primary_key => "groupid", :force => true do |t|
    t.string "vcemail",             :limit => 64
    t.string "vclocalname",         :limit => 64,   :null => false
    t.string "vccommonname",        :limit => 64,   :null => false
    t.string "vclocaldescription",  :limit => 1024, :null => false
    t.string "vccommondescription", :limit => 1024, :null => false
  end

  create_table "chatgroupoperator", :id => false, :force => true do |t|
    t.integer "groupid",    :null => false
    t.integer "operatorid", :null => false
  end

  create_table "chatmessage", :primary_key => "messageid", :force => true do |t|
    t.integer  "threadid",                                :null => false
    t.integer  "ikind",                                   :null => false
    t.integer  "agentId",                  :default => 0, :null => false
    t.text     "tmessage",                                :null => false
    t.datetime "dtmcreated"
    t.string   "tname",      :limit => 64
  end

  create_table "chatoperator", :primary_key => "operatorid", :force => true do |t|
    t.string   "vclogin",        :limit => 64,                    :null => false
    t.string   "vcpassword",     :limit => 64,                    :null => false
    t.string   "vclocalename",   :limit => 64,                    :null => false
    t.string   "vccommonname",   :limit => 64,                    :null => false
    t.string   "vcemail",        :limit => 64
    t.datetime "dtmlastvisited"
    t.integer  "istatus",                      :default => 0
    t.string   "vcavatar"
    t.string   "vcjabbername"
    t.integer  "iperm",                        :default => 65535
    t.datetime "dtmrestore"
    t.string   "vcrestoretoken", :limit => 64
  end

  create_table "chatresponses", :force => true do |t|
    t.string  "locale",  :limit => 8
    t.integer "groupid"
    t.string  "vcvalue", :limit => 1024, :null => false
  end

  create_table "chatrevision", :id => false, :force => true do |t|
    t.integer "id", :null => false
  end

  create_table "chatthread", :primary_key => "threadid", :force => true do |t|
    t.string   "userName",       :limit => 64,                :null => false
    t.string   "userid"
    t.string   "agentName",      :limit => 64
    t.integer  "agentId",                      :default => 0, :null => false
    t.datetime "dtmcreated"
    t.datetime "dtmmodified"
    t.integer  "lrevision",                    :default => 0, :null => false
    t.integer  "istate",                       :default => 0, :null => false
    t.integer  "ltoken",                                      :null => false
    t.string   "remote"
    t.text     "referer"
    t.integer  "nextagent",                    :default => 0, :null => false
    t.string   "locale",         :limit => 8
    t.datetime "lastpinguser"
    t.datetime "lastpingagent"
    t.integer  "userTyping",                   :default => 0
    t.integer  "agentTyping",                  :default => 0
    t.integer  "shownmessageid",               :default => 0, :null => false
    t.string   "userAgent"
    t.string   "messageCount",   :limit => 16
    t.integer  "groupid"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "cm_admin_db_errors", :primary_key => "ID", :force => true do |t|
    t.integer  "UserID",      :default => 0,     :null => false
    t.datetime "ErrorTime",                      :null => false
    t.string   "File",        :default => "",    :null => false
    t.integer  "Line",        :default => 0,     :null => false
    t.text     "Query",                          :null => false
    t.text     "Message",                        :null => false
    t.text     "Error",                          :null => false
    t.integer  "ErrorNumber", :default => 0,     :null => false
    t.string   "QueryString", :default => "",    :null => false
    t.text     "PVars",                          :null => false
    t.boolean  "Sent",        :default => false, :null => false
  end

  add_index "cm_admin_db_errors", ["ErrorTime"], :name => "ErrorTime"
  add_index "cm_admin_db_errors", ["File"], :name => "File"
  add_index "cm_admin_db_errors", ["Line"], :name => "Line"
  add_index "cm_admin_db_errors", ["Sent"], :name => "Sent"
  add_index "cm_admin_db_errors", ["UserID"], :name => "UserID"

  create_table "cm_admin_session", :primary_key => "SessionID", :force => true do |t|
    t.datetime "SAccTime",                                         :null => false
    t.integer  "IP",                                :default => 0, :null => false
    t.integer  "UserID",                            :default => 0, :null => false
    t.text     "SessionData", :limit => 2147483647,                :null => false
  end

  add_index "cm_admin_session", ["IP"], :name => "IP"
  add_index "cm_admin_session", ["SAccTime"], :name => "SAccTime"
  add_index "cm_admin_session", ["UserID"], :name => "UserID"

  create_table "cm_atrib", :primary_key => "ID", :force => true do |t|
    t.string  "Name",       :limit => 100, :default => "", :null => false
    t.integer "TemplateID",                :default => 0,  :null => false
    t.integer "ValueType",  :limit => 1,   :default => 0,  :null => false
    t.string  "Code",       :limit => 30,  :default => "", :null => false
    t.integer "IsVar",      :limit => 1,   :default => 1,  :null => false
    t.integer "ForSearch",  :limit => 1,   :default => 0,  :null => false
    t.integer "ShowOrder",  :limit => 1,   :default => 0,  :null => false
    t.integer "VNeditable", :limit => 1,   :default => 1,  :null => false
  end

  add_index "cm_atrib", ["TemplateID"], :name => "TemplateID"

  create_table "cm_downloads", :primary_key => "ID", :force => true do |t|
    t.integer "CategoryID",    :default => 0,  :null => false
    t.string  "Name",          :default => "", :null => false
    t.string  "FileName",      :default => "", :null => false
    t.integer "DownloadCount", :default => 0,  :null => false
  end

  create_table "cm_downloads_category", :primary_key => "ID", :force => true do |t|
    t.string  "Name",     :default => "", :null => false
    t.string  "Path"
    t.integer "ParentID", :default => 0,  :null => false
  end

  create_table "cm_group_right", :id => false, :force => true do |t|
    t.integer "GroupID",                 :default => 0, :null => false
    t.integer "ObjectID",                :default => 0, :null => false
    t.integer "ObjectType", :limit => 2, :default => 0, :null => false
    t.integer "GroupRight", :limit => 2, :default => 0, :null => false
  end

  add_index "cm_group_right", ["GroupID"], :name => "GroupID"
  add_index "cm_group_right", ["ObjectID"], :name => "ObjectID"
  add_index "cm_group_right", ["ObjectType"], :name => "ObjectType"

  create_table "cm_language", :primary_key => "ID", :force => true do |t|
    t.string  "Name",      :limit => 100, :default => "", :null => false
    t.string  "ShortName", :limit => 10,  :default => "", :null => false
    t.integer "IsDefault", :limit => 1,   :default => 0,  :null => false
  end

  add_index "cm_language", ["IsDefault"], :name => "IsDefault"
  add_index "cm_language", ["Name"], :name => "Name"
  add_index "cm_language", ["ShortName"], :name => "ShortName"

  create_table "cm_menu", :primary_key => "MenuID", :force => true do |t|
    t.string  "Name",             :limit => 100, :default => "", :null => false
    t.integer "TemplateID",                      :default => 0,  :null => false
    t.integer "SelectTemplateID",                :default => 0,  :null => false
    t.integer "MenuTemplateID",                  :default => 0,  :null => false
    t.integer "AutoFill",         :limit => 1,   :default => 0,  :null => false
    t.integer "AutoSelect",       :limit => 1,   :default => 0,  :null => false
    t.text    "Separator",                                       :null => false
  end

  create_table "cm_menuitem", :primary_key => "ItemID", :force => true do |t|
    t.integer "MenuID",                   :default => 0,  :null => false
    t.integer "ItemOrder",                :default => 0,  :null => false
    t.integer "ObjectID",                 :default => 0,  :null => false
    t.string  "Name",      :limit => 100, :default => "", :null => false
  end

  add_index "cm_menuitem", ["ItemID"], :name => "ItemID"
  add_index "cm_menuitem", ["MenuID"], :name => "MenuID"

  create_table "cm_menuitem_data", :id => false, :force => true do |t|
    t.integer "AtribID",               :default => 0, :null => false
    t.text    "Value",                                :null => false
    t.integer "FK",                    :default => 0, :null => false
    t.integer "Selected", :limit => 1, :default => 0, :null => false
    t.integer "ItemID",                :default => 0, :null => false
  end

  add_index "cm_menuitem_data", ["AtribID"], :name => "AtribID"
  add_index "cm_menuitem_data", ["ItemID"], :name => "ItemID"

  create_table "cm_message", :primary_key => "MessageID", :force => true do |t|
    t.integer  "SenderID", :default => 0,     :null => false
    t.text     "Subject",                     :null => false
    t.text     "Message",                     :null => false
    t.datetime "SendTime",                    :null => false
    t.string   "Context",  :default => "",    :null => false
    t.boolean  "Deleted",  :default => false, :null => false
  end

  add_index "cm_message", ["Deleted"], :name => "Deleted"
  add_index "cm_message", ["SenderID"], :name => "SenderID"
  add_index "cm_message", ["Subject"], :name => "Subject", :length => {"Subject"=>100}

  create_table "cm_module", :primary_key => "ModuleID", :force => true do |t|
    t.string  "Name",          :limit => 100, :default => "", :null => false
    t.integer "Type",          :limit => 1,   :default => 0,  :null => false
    t.string  "Vendor",        :limit => 100, :default => "", :null => false
    t.string  "Version",       :limit => 10,  :default => "", :null => false
    t.string  "ClassName",     :limit => 30,  :default => "", :null => false
    t.string  "ScriptName",    :limit => 50,  :default => "", :null => false
    t.integer "ModuleDocID",                  :default => 0,  :null => false
    t.integer "SettingsDocID",                :default => 0,  :null => false
  end

  create_table "cm_msg_receiver", :primary_key => "ID", :force => true do |t|
    t.integer "MessageID",  :default => 0,     :null => false
    t.integer "ReceiverID", :default => 0,     :null => false
    t.boolean "Received",   :default => false, :null => false
    t.boolean "Deleted",    :default => false, :null => false
    t.boolean "Popped",     :default => false, :null => false
  end

  add_index "cm_msg_receiver", ["Deleted"], :name => "Deleted"
  add_index "cm_msg_receiver", ["MessageID", "ReceiverID"], :name => "MessageID"
  add_index "cm_msg_receiver", ["Popped"], :name => "Popped"
  add_index "cm_msg_receiver", ["Received"], :name => "Received"

  create_table "cm_page", :primary_key => "ID", :force => true do |t|
    t.string   "Title",        :limit => 100, :default => "",          :null => false
    t.string   "Code",         :limit => 100, :default => "",          :null => false
    t.integer  "TemplateID",                  :default => 0,           :null => false
    t.integer  "CategoryID"
    t.integer  "InMap",        :limit => 1,   :default => 0,           :null => false
    t.integer  "IsStatic",     :limit => 1,   :default => 0,           :null => false
    t.integer  "CreatorID",                   :default => 0,           :null => false
    t.integer  "EditorID",                    :default => 0,           :null => false
    t.datetime "CreateTime",                                           :null => false
    t.datetime "LastUpdate",                                           :null => false
    t.string   "PageProducer", :limit => 50,  :default => "index.php", :null => false
  end

  add_index "cm_page", ["TemplateID"], :name => "TemplateID"

  create_table "cm_page_atrib", :id => false, :force => true do |t|
    t.integer "PageID",                           :default => 0, :null => false
    t.integer "AtribID",                          :default => 0, :null => false
    t.text    "Value",      :limit => 2147483647,                :null => false
    t.integer "FK"
    t.integer "LanguageID",                       :default => 0, :null => false
  end

  create_table "cm_page_cache", :id => false, :force => true do |t|
    t.integer  "PageID",     :default => 0, :null => false
    t.integer  "LanguageID", :default => 0, :null => false
    t.datetime "LastUpdate",                :null => false
    t.text     "MacrosList",                :null => false
  end

  add_index "cm_page_cache", ["LanguageID"], :name => "LanguageID"
  add_index "cm_page_cache", ["PageID"], :name => "PageID"

  create_table "cm_page_category", :primary_key => "ID", :force => true do |t|
    t.string  "Name",        :limit => 100, :default => "", :null => false
    t.integer "TemplateID"
    t.integer "PageType",    :limit => 1,   :default => 0,  :null => false
    t.string  "Description"
    t.integer "ParentID",                   :default => 0,  :null => false
    t.string  "Path"
  end

  add_index "cm_page_category", ["ParentID"], :name => "ParentID"

  create_table "cm_page_template", :primary_key => "ID", :force => true do |t|
    t.string  "Name",          :limit => 100, :default => "",     :null => false
    t.string  "Code",          :limit => 100, :default => "code"
    t.integer "System",        :limit => 1,   :default => 0,      :null => false
    t.string  "FileName",      :limit => 50
    t.string  "CSS",           :limit => 50
    t.integer "ParentID"
    t.integer "ParentAtribID"
  end

  add_index "cm_page_template", ["Code"], :name => "Code"

  create_table "cm_picture", :primary_key => "ID", :force => true do |t|
    t.string  "Name",       :limit => 100, :default => "", :null => false
    t.string  "FileName",   :limit => 50,  :default => "", :null => false
    t.string  "FileHash",   :limit => 32,  :default => "", :null => false
    t.integer "CategoryID",                :default => 1,  :null => false
  end

  add_index "cm_picture", ["CategoryID"], :name => "CategoryID"

  create_table "cm_picture_category", :primary_key => "ID", :force => true do |t|
    t.string  "Name",     :default => "", :null => false
    t.string  "Path"
    t.integer "ParentID", :default => 0,  :null => false
  end

  create_table "cm_runtime", :primary_key => "ID", :force => true do |t|
    t.integer  "UserID",     :default => 0,  :null => false
    t.datetime "SystemTime",                 :null => false
    t.string   "Script",     :default => "", :null => false
    t.string   "RunTime",    :default => "", :null => false
  end

  add_index "cm_runtime", ["UserID"], :name => "UserID"

  create_table "cm_session", :primary_key => "SessionID", :force => true do |t|
    t.datetime "SAccTime",                   :null => false
    t.integer  "IP",          :default => 0, :null => false
    t.integer  "UserID",      :default => 0, :null => false
    t.text     "SessionData",                :null => false
  end

  add_index "cm_session", ["IP"], :name => "IP"
  add_index "cm_session", ["SAccTime"], :name => "SAccTime"
  add_index "cm_session", ["UserID"], :name => "UserID"

  create_table "cm_settings", :id => false, :force => true do |t|
    t.string   "AdminEmail",        :limit => 50
    t.datetime "LastSent",                                        :null => false
    t.datetime "LastSelected",                                    :null => false
    t.string   "UnsubscribeScript",               :default => "", :null => false
    t.integer  "RootDocGroupMode",                :default => 0,  :null => false
    t.integer  "RootDocSortMode",                 :default => 0,  :null => false
  end

  create_table "cm_template_atrib", :id => false, :force => true do |t|
    t.integer "LanguageID", :default => 0, :null => false
    t.integer "AtribID",    :default => 0, :null => false
    t.text    "Value",                     :null => false
    t.integer "FK"
  end

  create_table "cm_user_right", :id => false, :force => true do |t|
    t.integer "UserID",                  :default => 0, :null => false
    t.integer "ObjectID",                :default => 0, :null => false
    t.integer "ObjectType", :limit => 2, :default => 0, :null => false
    t.integer "UserRight",  :limit => 2, :default => 0, :null => false
  end

  add_index "cm_user_right", ["ObjectID"], :name => "ObjectID"
  add_index "cm_user_right", ["ObjectType"], :name => "ObjectType"
  add_index "cm_user_right", ["UserID"], :name => "UserID"

  create_table "cm_user_settings", :primary_key => "Code", :force => true do |t|
    t.string "Name",  :limit => 100, :default => "", :null => false
    t.string "Value",                :default => "", :null => false
  end

  create_table "cms_basic_pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "divisions", :primary_key => "custom_id", :force => true do |t|
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "custom_league_id"
    t.string   "name",             :limit => 50, :null => false
  end

  create_table "dm_action", :primary_key => "ActionID", :force => true do |t|
    t.string  "Name",              :default => "", :null => false
    t.text    "Code",                              :null => false
    t.integer "Type", :limit => 1, :default => 0,  :null => false
  end

  create_table "dm_doc", :primary_key => "DocID", :force => true do |t|
    t.integer  "TemplateID",               :default => 0, :null => false
    t.integer  "CreatorID",                :default => 0, :null => false
    t.datetime "CreateTime",                              :null => false
    t.integer  "EditorID",                 :default => 0, :null => false
    t.datetime "ModifyTime",                              :null => false
    t.integer  "ParentDocID",              :default => 0, :null => false
    t.integer  "GroupMode",                :default => 0, :null => false
    t.integer  "SortMode",                 :default => 1, :null => false
    t.integer  "Published",   :limit => 1, :default => 0, :null => false
    t.integer  "Deleted",     :limit => 1, :default => 0, :null => false
    t.integer  "_Left",                    :default => 0, :null => false
    t.integer  "_Right",                   :default => 0, :null => false
    t.integer  "SortOrder",                :default => 0, :null => false
  end

  add_index "dm_doc", ["CreatorID"], :name => "CreatorID"
  add_index "dm_doc", ["Deleted"], :name => "Deleted"
  add_index "dm_doc", ["EditorID"], :name => "EditorID"
  add_index "dm_doc", ["ParentDocID"], :name => "ParentDocID"
  add_index "dm_doc", ["TemplateID"], :name => "TemplateID"
  add_index "dm_doc", ["_Left"], :name => "_Left"
  add_index "dm_doc", ["_Right"], :name => "_Right"

  create_table "dm_doc_field_template", :primary_key => "FieldID", :force => true do |t|
    t.integer "TemplateID",                 :default => 0,    :null => false
    t.string  "Code",        :limit => 20,  :default => "",   :null => false
    t.string  "Name",        :limit => 100, :default => "",   :null => false
    t.string  "Description",                :default => "",   :null => false
    t.integer "FieldType",   :limit => 1,   :default => 0,    :null => false
    t.integer "ShowInList",  :limit => 1,   :default => 1,    :null => false
    t.integer "ShowOrder",   :limit => 1,   :default => 0,    :null => false
    t.integer "MultiLang",   :limit => 1,   :default => 1,    :null => false
    t.integer "Required",    :limit => 1,   :default => 0,    :null => false
    t.string  "Options",                    :default => "",   :null => false
    t.string  "AllowedTpls",                :default => "",   :null => false
    t.boolean "AllowAll",                   :default => true, :null => false
    t.integer "Tag",         :limit => 2,   :default => 0,    :null => false
  end

  add_index "dm_doc_field_template", ["Code"], :name => "Code"
  add_index "dm_doc_field_template", ["MultiLang"], :name => "MultiLang"
  add_index "dm_doc_field_template", ["ShowOrder"], :name => "ShowOrder"
  add_index "dm_doc_field_template", ["Tag"], :name => "Tag"
  add_index "dm_doc_field_template", ["TemplateID"], :name => "TemplateID"

  create_table "dm_doc_link", :id => false, :force => true do |t|
    t.integer "MasterDocID", :default => 0, :null => false
    t.integer "FieldID",     :default => 0, :null => false
    t.integer "OrderNum",    :default => 0, :null => false
    t.integer "SlaveDocID",  :default => 0, :null => false
  end

  add_index "dm_doc_link", ["OrderNum"], :name => "idx_ordernum"

  create_table "dm_doc_link_disabled", :id => false, :force => true do |t|
    t.integer "DocID",      :default => 0, :null => false
    t.integer "TemplateID", :default => 0, :null => false
  end

  create_table "dm_doc_link_template", :id => false, :force => true do |t|
    t.integer "ParentID", :default => 0,     :null => false
    t.integer "ChildID",  :default => 0,     :null => false
    t.boolean "Mode",     :default => false, :null => false
  end

  create_table "dm_doc_template", :primary_key => "TemplateID", :force => true do |t|
    t.string  "Name",                   :limit => 100, :default => "", :null => false
    t.string  "Description"
    t.string  "Code",                   :limit => 20,  :default => "", :null => false
    t.string  "Icon"
    t.string  "SelectIcon"
    t.integer "Persistent",             :limit => 1,   :default => 0,  :null => false
    t.integer "Publish",                :limit => 1,   :default => 0,  :null => false
    t.integer "DeleteChild",            :limit => 1,   :default => 0,  :null => false
    t.integer "DocType",                :limit => 1,   :default => 0,  :null => false
    t.integer "VersionControl",         :limit => 1,   :default => 0,  :null => false
    t.integer "OnBCreateActionID",                     :default => 0,  :null => false
    t.integer "OnCreateActionID",                      :default => 0,  :null => false
    t.integer "OnBModifyActionID",                     :default => 0,  :null => false
    t.integer "OnModifyActionID",                      :default => 0,  :null => false
    t.integer "OnDeleteActionID",                      :default => 0,  :null => false
    t.integer "OnUserActionID",                        :default => 0,  :null => false
    t.integer "OnCheckActionID",                       :default => 0,  :null => false
    t.integer "OnPrepareActionID",                     :default => 0,  :null => false
    t.integer "OnChangeParentActionID",                :default => 0,  :null => false
    t.integer "ModuleID",                              :default => 0,  :null => false
    t.integer "Tag",                    :limit => 2,   :default => 0,  :null => false
    t.integer "Options",                               :default => 0,  :null => false
  end

  add_index "dm_doc_template", ["Code"], :name => "Code", :unique => true
  add_index "dm_doc_template", ["Tag"], :name => "Tag"

  create_table "dm_group_obj_right", :id => false, :force => true do |t|
    t.integer "GroupID",    :default => 0, :null => false
    t.integer "ObjectID",   :default => 0, :null => false
    t.integer "GroupRight", :default => 0, :null => false
  end

  add_index "dm_group_obj_right", ["GroupID"], :name => "GroupID"
  add_index "dm_group_obj_right", ["ObjectID"], :name => "ObjectID"

  create_table "dm_group_template_right", :id => false, :force => true do |t|
    t.integer "TemplateID", :default => 0, :null => false
    t.integer "GroupID",    :default => 0, :null => false
    t.integer "GroupRight", :default => 0, :null => false
  end

  add_index "dm_group_template_right", ["GroupID"], :name => "GroupID"
  add_index "dm_group_template_right", ["TemplateID"], :name => "TemplateID"

  create_table "dm_module", :primary_key => "ID", :force => true do |t|
    t.string  "Name",           :limit => 100, :default => "",    :null => false
    t.string  "TreeName",       :limit => 100, :default => "",    :null => false
    t.string  "Description",                   :default => "",    :null => false
    t.boolean "Value",                         :default => false, :null => false
    t.string  "RootNodeSource", :limit => 100, :default => "",    :null => false
    t.string  "ModuleSource",   :limit => 100, :default => "",    :null => false
    t.integer "ShowOrder",                     :default => 0,     :null => false
    t.boolean "Disabled",                      :default => false, :null => false
  end

  add_index "dm_module", ["Disabled"], :name => "Disabled"
  add_index "dm_module", ["ShowOrder"], :name => "ShowOrder"
  add_index "dm_module", ["Value"], :name => "Value"

  create_table "dm_secure_object", :primary_key => "ObjectID", :force => true do |t|
    t.string "Code", :limit => 25,  :default => "", :null => false
    t.string "Name", :limit => 100, :default => "", :null => false
  end

  create_table "dm_smart_cache", :primary_key => "CacheID", :force => true do |t|
    t.string   "PageUID",    :limit => 32, :default => "", :null => false
    t.datetime "ModifyTime",                               :null => false
    t.integer  "UsageCount",               :default => 0,  :null => false
    t.integer  "FileSize",                 :default => 0,  :null => false
  end

  add_index "dm_smart_cache", ["PageUID"], :name => "PageUID", :unique => true

  create_table "dm_smart_cache_depend", :id => false, :force => true do |t|
    t.integer "CacheID",              :default => 0, :null => false
    t.integer "DocID",                :default => 0, :null => false
    t.integer "Mode",    :limit => 1, :default => 0, :null => false
  end

  add_index "dm_smart_cache_depend", ["CacheID"], :name => "CasheID"
  add_index "dm_smart_cache_depend", ["DocID"], :name => "DocID"

  create_table "dm_tree_roots", :primary_key => "ID", :force => true do |t|
    t.string  "Name",        :limit => 250, :default => "", :null => false
    t.string  "Description", :limit => 250, :default => "", :null => false
    t.integer "Type",        :limit => 1,   :default => 0,  :null => false
    t.integer "EntityID",                   :default => 0,  :null => false
    t.integer "ShowOrder",   :limit => 1,   :default => 0,  :null => false
  end

  add_index "dm_tree_roots", ["ShowOrder"], :name => "ShowOrder"
  add_index "dm_tree_roots", ["Type", "EntityID"], :name => "Type"

  create_table "dm_user", :primary_key => "UserID", :force => true do |t|
    t.integer "GroupID",                    :default => 0,     :null => false
    t.string  "Name",        :limit => 100, :default => "",    :null => false
    t.string  "Description",                :default => "",    :null => false
    t.string  "Email",       :limit => 50,  :default => "",    :null => false
    t.string  "Login",       :limit => 30,  :default => "",    :null => false
    t.string  "Password",    :limit => 60,  :default => "",    :null => false
    t.boolean "Deleted",                    :default => false, :null => false
    t.integer "LanguageID",                 :default => 0,     :null => false
    t.integer "IP",                         :default => 0,     :null => false
  end

  add_index "dm_user", ["GroupID"], :name => "GroupID"
  add_index "dm_user", ["Name"], :name => "Name"

  create_table "dm_user_group", :primary_key => "GroupID", :force => true do |t|
    t.string "Name",        :limit => 100, :default => "", :null => false
    t.string "Description",                :default => "", :null => false
  end

  create_table "dm_user_right", :id => false, :force => true do |t|
    t.integer "UserID",    :default => 0, :null => false
    t.integer "DocID",     :default => 0, :null => false
    t.integer "UserRight", :default => 0, :null => false
  end

  add_index "dm_user_right", ["DocID"], :name => "DocID"
  add_index "dm_user_right", ["UserID"], :name => "UserID"

  create_table "dm_user_settings", :primary_key => "UserID", :force => true do |t|
    t.boolean "DescrOnDocEdit",                        :default => true,  :null => false
    t.boolean "NewWindowMode",                         :default => true,  :null => false
    t.boolean "ShowSystemDocFields",                   :default => false, :null => false
    t.boolean "ShowDocumentsRoot",                     :default => false, :null => false
    t.boolean "ShowParentFieldsOnEC",                  :default => true,  :null => false
    t.integer "ShowCalculatedFieldsOnED", :limit => 1, :default => 0,     :null => false
    t.integer "PagesEditMode",            :limit => 1, :default => 0,     :null => false
  end

  create_table "dm_user_todo", :primary_key => "ID", :force => true do |t|
    t.integer "UserID",                     :default => 0, :null => false
    t.text    "ToDo",                                      :null => false
    t.integer "PriorityOrder", :limit => 1, :default => 0, :null => false
  end

  add_index "dm_user_todo", ["UserID", "PriorityOrder"], :name => "UserID"

  create_table "dm_version", :primary_key => "ID", :force => true do |t|
    t.integer  "DocID",                        :default => 0, :null => false
    t.datetime "Date",                                        :null => false
    t.text     "Data",   :limit => 2147483647,                :null => false
    t.integer  "UserID",                       :default => 0, :null => false
  end

  create_table "drafts", :force => true do |t|
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "player_id"
    t.integer  "team_id"
    t.date     "date"
    t.integer  "round"
    t.integer  "pick"
    t.integer  "overall"
    t.string   "college",    :limit => 100
    t.text     "notes"
  end

  create_table "fans", :force => true do |t|
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "name",       :limit => 100, :null => false
  end

  create_table "fans_teams", :id => false, :force => true do |t|
    t.integer "fan_id"
    t.integer "team_id"
  end

  create_table "field_tests", :force => true do |t|
    t.string   "string_field"
    t.text     "text_field"
    t.integer  "integer_field"
    t.float    "float_field"
    t.decimal  "decimal_field",             :precision => 10, :scale => 0
    t.datetime "datetime_field"
    t.datetime "timestamp_field"
    t.time     "time_field"
    t.date     "date_field"
    t.boolean  "boolean_field"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.string   "format"
    t.string   "restricted_field"
    t.string   "protected_field"
    t.string   "paperclip_asset_file_name"
    t.string   "dragonfly_asset_uid"
    t.string   "carrierwave_asset"
  end

  create_table "leagues", :force => true do |t|
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "name",       :limit => 50, :null => false
  end

  create_table "lng_strcategory", :primary_key => "CategoryID", :force => true do |t|
    t.string "Name",   :limit => 100, :default => "", :null => false
    t.string "Code",   :limit => 20,  :default => "", :null => false
    t.string "Prefix", :limit => 5,   :default => "", :null => false
  end

  add_index "lng_strcategory", ["Code"], :name => "Code"

  create_table "lng_stridx", :primary_key => "IndexID", :force => true do |t|
    t.string  "StringIndex", :limit => 25, :default => "", :null => false
    t.text    "Description",                               :null => false
    t.integer "CategoryID",                :default => 0,  :null => false
  end

  add_index "lng_stridx", ["CategoryID"], :name => "CategoryID"
  add_index "lng_stridx", ["StringIndex"], :name => "StringIndex"

  create_table "lng_string", :id => false, :force => true do |t|
    t.integer "IndexID",    :default => 0, :null => false
    t.integer "LanguageID", :default => 0, :null => false
    t.text    "Data",                      :null => false
  end

  add_index "lng_string", ["IndexID", "LanguageID"], :name => "IndexID"

  create_table "log_detail", :primary_key => "ID", :force => true do |t|
    t.datetime "VisitTime",                               :null => false
    t.integer  "LogID",     :limit => 8,  :default => 0,  :null => false
    t.string   "PageKey",   :limit => 32, :default => "", :null => false
  end

  add_index "log_detail", ["LogID"], :name => "LogID"
  add_index "log_detail", ["PageKey"], :name => "PageKey"

  create_table "log_net_mask", :id => false, :force => true do |t|
    t.integer "NetStart", :limit => 8,   :default => 0,  :null => false
    t.integer "NetEnd",   :limit => 8,   :default => 0,  :null => false
    t.string  "NetName",  :limit => 100, :default => "", :null => false
    t.integer "RegionID",                :default => 0,  :null => false
  end

  add_index "log_net_mask", ["RegionID"], :name => "RegionID"

  create_table "log_pages", :primary_key => "PageKey", :force => true do |t|
    t.string "Name",    :limit => 200, :default => "", :null => false
    t.string "PageURI",                :default => "", :null => false
  end

  create_table "log_region", :primary_key => "RegionID", :force => true do |t|
    t.string  "Name",     :limit => 100, :default => "",   :null => false
    t.string  "Zone",     :limit => 2,   :default => "RU", :null => false
    t.integer "TimeZone", :limit => 2,   :default => 0,    :null => false
    t.integer "ParentID",                :default => 0,    :null => false
    t.integer "cleft",                   :default => 0,    :null => false
    t.integer "cright",                  :default => 0,    :null => false
  end

  add_index "log_region", ["ParentID"], :name => "ParentID"

  create_table "log_session", :primary_key => "LogID", :force => true do |t|
    t.integer  "VisitorID",                    :default => 0,  :null => false
    t.integer  "VisitorIP",                    :default => 0,  :null => false
    t.integer  "PageVisitCount",               :default => 0,  :null => false
    t.string   "Reference",                    :default => "", :null => false
    t.string   "EntryPageKey",   :limit => 32, :default => "", :null => false
    t.datetime "EntryTime",                                    :null => false
    t.string   "ExitPageKey",    :limit => 32, :default => "", :null => false
    t.datetime "ExitTime",                                     :null => false
  end

  add_index "log_session", ["EntryTime"], :name => "EntryTime"
  add_index "log_session", ["VisitorID"], :name => "VisitorID"
  add_index "log_session", ["VisitorIP"], :name => "VisitorIP"

  create_table "log_system_info", :primary_key => "InfoID", :force => true do |t|
    t.integer "Type",  :limit => 1,   :default => 0,  :null => false
    t.string  "Value", :limit => 100, :default => "", :null => false
  end

  add_index "log_system_info", ["Type"], :name => "Type"

  create_table "log_visitor", :primary_key => "VisitorID", :force => true do |t|
    t.integer  "VisitorIP",    :default => 0, :null => false
    t.datetime "CreateTime",                  :null => false
    t.integer  "OSID",         :default => 0, :null => false
    t.integer  "BrowserID",    :default => 0, :null => false
    t.integer  "ResolutionID", :default => 0, :null => false
  end

  add_index "log_visitor", ["BrowserID"], :name => "BrowserID"
  add_index "log_visitor", ["OSID"], :name => "OSID"
  add_index "log_visitor", ["ResolutionID"], :name => "ResolutionID"

  create_table "ml2_content", :id => false, :force => true do |t|
    t.integer "GroupID",    :default => 0, :null => false
    t.integer "LanguageID", :default => 0, :null => false
    t.text    "Content",                   :null => false
    t.string  "subject"
  end

  create_table "ml2_group", :primary_key => "GroupID", :force => true do |t|
    t.string   "Name",        :limit => 100
    t.string   "Description"
    t.integer  "ParentDocID"
    t.string   "TplPrefix"
    t.datetime "Dispatch",                   :null => false
  end

  create_table "ml2_settings", :primary_key => "SettingID", :force => true do |t|
    t.string "Name",  :limit => 128, :default => "", :null => false
    t.string "Value", :limit => 128, :default => "", :null => false
    t.string "Code",  :limit => 64,  :default => "", :null => false
  end

  create_table "ml2_subscriber", :primary_key => "SubscriberID", :force => true do |t|
    t.string  "Name",       :limit => 50, :default => "", :null => false
    t.string  "Email",      :limit => 50, :default => "", :null => false
    t.string  "Password",   :limit => 20, :default => "", :null => false
    t.integer "LanguageID",               :default => 1,  :null => false
  end

  add_index "ml2_subscriber", ["Email"], :name => "Email"

  create_table "ml2_subscription", :id => false, :force => true do |t|
    t.integer  "GroupID",          :default => 0, :null => false
    t.integer  "SubscriberID",     :default => 0, :null => false
    t.datetime "SubscriptionDate"
  end

  create_table "nested_field_tests", :force => true do |t|
    t.string   "title"
    t.integer  "field_test_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "main", :force => true do |t|
    t.integer  "node_id"
    t.string   "name"
    t.date     "date"
    t.text     "anons"
    t.text     "text"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "main", ["id"], :name => "idx___DocID"
  add_index "main", ["node_id"], :name => "idx___ParentDocID"

  create_table "nodes", :force => true do |t|
    t.integer "node_id",                       :default => 0,  :null => false
    t.string  "name",                          :default => "", :null => false
    t.string  "url"
    t.text    "content"
    t.integer "in_site_map",      :limit => 1
    t.string  "content_producer"
    t.string  "the_link_to"
    t.string  "keywords"
    t.string  "description"
    t.string  "ancestry"
    t.string  "position"
  end

  add_index "nodes", ["ancestry"], :name => "index_nodes_on_ancestry"
  add_index "nodes", ["id"], :name => "idx___DocID"
  add_index "nodes", ["node_id"], :name => "idx___ParentDocID"

  create_table "photomains", :force => true do |t|
    t.integer  "setting_id",                         :null => false
    t.string   "name",               :default => ""
    t.string   "photo"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photomains", ["id"], :name => "idx___DocID"
  add_index "photomains", ["setting_id"], :name => "idx___ParentDocID"

  create_table "photos", :force => true do |t|
    t.string   "name",               :default => ""
    t.text     "comment"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "album_id"
  end

  add_index "photos", ["id"], :name => "idx___DocID"

  create_table "players", :force => true do |t|
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.datetime "deleted_at"
    t.integer  "team_id"
    t.string   "name",       :limit => 100,                    :null => false
    t.string   "position",   :limit => 50
    t.integer  "number",                                       :null => false
    t.boolean  "retired",                   :default => false
    t.boolean  "injured",                   :default => false
    t.date     "born_on"
    t.text     "notes"
    t.boolean  "suspended",                 :default => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "rails_admin_histories", ["item", "table"], :name => "index_histories_on_item_and_table"

  create_table "rel_tests", :force => true do |t|
    t.integer  "league_id"
    t.integer  "division_id", :null => false
    t.integer  "player_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "rich_rich_files", :force => true do |t|
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "rich_file_file_name"
    t.string   "rich_file_content_type"
    t.integer  "rich_file_file_size"
    t.datetime "rich_file_updated_at"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.text     "uri_cache"
    t.string   "simplified_type",        :default => "file"
  end

  create_table "rs_report", :primary_key => "ReportID", :force => true do |t|
    t.integer "CategoryID",                 :default => 0,     :null => false
    t.string  "Name",        :limit => 100, :default => "",    :null => false
    t.string  "Description",                :default => "",    :null => false
    t.string  "FileName",    :limit => 100, :default => "",    :null => false
    t.boolean "Disabled",                   :default => false, :null => false
  end

  add_index "rs_report", ["CategoryID"], :name => "CategoryID"

  create_table "rs_report_category", :primary_key => "CategoryID", :force => true do |t|
    t.string  "Name",        :limit => 100, :default => "", :null => false
    t.string  "Description",                :default => "", :null => false
    t.integer "ParentID",                   :default => 0,  :null => false
  end

  create_table "sections", :force => true do |t|
    t.string   "title"
    t.string   "uri"
    t.string   "email",                           :default => ""
    t.integer  "allowapplication",   :limit => 1
    t.float    "pid",                             :default => 0.0
    t.text     "footerinfo"
    t.text     "yandex"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "sections", ["id"], :name => "idx___DocID"

  create_table "settings", :primary_key => "__DocID", :force => true do |t|
    t.integer "__ParentDocID",  :default => 0,   :null => false
    t.string  "name",           :default => "",  :null => false
    t.string  "adminEmail",     :default => "",  :null => false
    t.float   "countnews",      :default => 0.0
    t.float   "mainnews",       :default => 0.0
    t.text    "footerinfo"
    t.text    "footercont"
    t.integer "countstat"
    t.text    "contheader"
    t.text    "telheader"
    t.float   "countalbums",    :default => 0.0
    t.text    "about"
    t.string  "fonmus"
    t.text    "aboutumka"
    t.text    "contheaderumka"
    t.float   "countteachers",  :default => 0.0
    t.text    "aboutdesign"
    t.text    "aboutfitness"
    t.text    "aboutcafe"
    t.text    "abouteventus"
    t.text    "aboutlang"
    t.text    "skype"
    t.string  "flash"
    t.integer "section_id"
  end

  add_index "settings", ["__DocID"], :name => "idx___DocID"
  add_index "settings", ["__ParentDocID"], :name => "idx___ParentDocID"

  create_table "teachers", :force => true do |t|
    t.integer  "node_id",                            :null => false
    t.string   "name",               :default => ""
    t.string   "post"
    t.text     "anons"
    t.text     "text"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "teachers", ["id"], :name => "idx___DocID"
  add_index "teachers", ["node_id"], :name => "idx___ParentDocID"

  create_table "teams", :force => true do |t|
    t.datetime "created_at",                                                   :null => false
    t.datetime "updated_at",                                                   :null => false
    t.integer  "division_id"
    t.string   "name",           :limit => 50
    t.string   "logo_url"
    t.string   "manager",        :limit => 100,                                :null => false
    t.string   "ballpark",       :limit => 100
    t.string   "mascot",         :limit => 100
    t.integer  "founded"
    t.integer  "wins"
    t.integer  "losses"
    t.float    "win_percentage"
    t.decimal  "revenue",                       :precision => 18, :scale => 2
    t.string   "color"
  end

  create_table "unscoped_pages", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "roles"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
