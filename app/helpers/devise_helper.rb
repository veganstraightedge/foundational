module DeviseHelper
  def wrapper_row_classes
    'row' if devise_controller?
  end

  def wrapper_columns_classes
    'col-12 col-md-8 offset-md-2' if devise_controller?
  end
end
