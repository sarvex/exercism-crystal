module Space
  struct Age
    SECONDS_PER_EARTH_YEAR = 31557600

    def age_on_mercury
      @years / 0.2408467
    end

    def age_on_venus
      @years / 0.61519726
    end

    def age_on_mars
      @years / 1.8808158
    end

    def age_on_jupiter
      @years / 11.862615
    end

    def age_on_saturn
      @years / 29.447498
    end

    def age_on_uranus
      @years / 84.016846
    end

    def age_on_neptune
      @years / 164.79132
    end

    def age_on_earth
      @years
    end

    def Age.from_seconds(seconds : Int32) : Age
      new years: (seconds.to_f / SECONDS_PER_EARTH_YEAR)
    end

    def initialize(@years : Float64); end
  end
end
