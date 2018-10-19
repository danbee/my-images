namespace :images do
  desc "Migrate all the images to Active Storage"
  task migrate: :environment do
    Image.all.each do |image|
      image.image.attach(
        io: image.df_image.file,
        filename: image.df_image.name,
      )
    end
  end
end
