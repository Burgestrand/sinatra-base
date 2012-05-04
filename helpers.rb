module Helpers
  def asset_path(source)
    asset = settings.sprockets.find_asset(source)
    File.join("/assets", asset.digest_path) if asset
  end
end
