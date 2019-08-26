ROM::SQL.migration do
  change do
    create_table :auth_user do
      primary_key :id

      column :username, 'character varying(150)', null: false
      column :email, 'character varying(254)', null: false
      column :password, 'character varying(128)', null: false
      column :first_name, 'character varying(30)', null: false
      column :last_name, 'character varying(30)', null: false

      column :is_superuser, 'boolean', null: false
      column :is_staff, 'boolean', null: false
      column :is_active, 'boolean', null: false

      column :date_joined, 'timestamp with time zone', null: false
      column :last_login, 'timestamp with time zone', null: false
    end
  end
end
