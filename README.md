# Sinatra Base

Playing with Sinatra from time to time, I tend to do the setup in the same way.

- Development console with pry, started with `rake console`.
- Asset pipeline with sprockets, with support for static compilation using
  the supplied rake task `rake assetpack:build`, and minification in production.
- Compass support.
