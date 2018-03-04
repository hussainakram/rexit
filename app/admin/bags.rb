ActiveAdmin.register Bag do
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
  form do |f|
    f.inputs do
      f.input :bag_type, as: :select, collection: ['PET', 'TIN', 'Mixed/Dry']
      f.input :weight, as: :number
      f.input :price
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit bags: [:bag_type, :weight, :price]
    end
    def update
      calculate_price
    end

    def calculate_price
      @bag = Bag.find(params[:id])
      @bag.update_column(:weight, params[:bag][:weight])
      if @bag.bag_type.present?
        if @bag.bag_type == "PET"
          price = @bag.weight.to_i * 32
          @bag.update_column(:price, price)
        elsif @bag.bag_type == "TIN"
          price = @bag.weight.to_i * 52
          @bag.update_column(:price, price)
        elsif @bag.bag_type == "Mixed/Dry"
          @bag.update_column(:price, @bag.weight * 12)
        end
      end
      redirect_to resource_path
    end
  end
end
