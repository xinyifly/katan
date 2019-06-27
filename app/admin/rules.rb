ActiveAdmin.register Rule do
  permit_params :poll_id, :key, :value

  form do |f|
    f.inputs do
      f.input :poll
      f.input :key, as: :select
      f.input :value
    end
    f.actions
  end
end
