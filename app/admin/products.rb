ActiveAdmin.register Product do
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

  permit_params :name, :description, :price, :category_id, :image,
                :image_file_name, :image_content_type, :image_file_size,
                :image_updated_at, image_attributes: :_destroy

  # manual dashboard form override adds image uploader (Browse...)
  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :category_id
      f.input :image, as: :file
      # if an image is present, allow deletion
      if f.object.image.present?
        f.semantic_fields_for :image_attributes do |image_fields|
          image_fields.input :_destroy, as: :boolean, label: 'Delete Image?'
        end
      end
    end
    f.actions
  end

end
