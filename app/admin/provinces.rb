ActiveAdmin.register Province do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :name, :pst_rate, :hst_rate, :country_id,
                users: [:id, :username, :password, :first_name,
                        :last_name, :email, :phone, :address, :city,
                        :post_code, :province_id, :_destroy]

end
