Rails 3 syntax.

    def as_json(options=nil)
      super({
        only: :name,
        include: {
          weapons: {
            only: [:name, :ammo]
          }
        }
        })
    end
