    Madul = require 'madul'

    class KHAAANfig extends Madul

      load_file: (location, done, fail) ->
        try
          @_populate_config_from require location
          done()
        catch e
          fail e

      load_args: (args, done) ->
        @_populate_config_from args
        done()

      _populate_config_from: (obj) =>
        for key, val of obj
          if typeof val != 'undefined'
            if typeof val == 'object' && val != null && val.length? == false
              @_dive_deeper key, val, @
            else
              @[key] = val

      _dive_deeper: (prop, obj, context) =>
        for key, val of obj
          context[prop] = { } unless context[prop]?

          if typeof val == 'object' && val != null && val.length? == false
            @_dive_deeper key, val, context[prop]
          else
            context[prop][key] = val

    module.exports = KHAAANfig
