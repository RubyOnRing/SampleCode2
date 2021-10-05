# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets')
Rails.application.config.assets.precompile += ['brand/coreui.svg']

# Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
Rails.application.config.assets.paths << Rails.root.join('node_modules')

lib_files = Dir[Rails.root.join('node_modules', '@coreui', 'icons', 'svg', '**', '[^_]*.svg')]
lib_files.map! { |file| file.sub(%r(#{Rails.root.join('public')}), '') }
Rails.application.config.assets.precompile += lib_files
