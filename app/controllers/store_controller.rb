class StoreController < ApplicationController
  layout 'store'
  def products
  end

  def contact
  end

  def single
  end

  def typo
  end
    
    def anillos
      @anillos = Image.where(category: "Anillos").reverse_order
    end
    
    def aretas
      @aretas = Image.where(category: "Aretas").reverse_order
    end
    
    def collares
      @collares = Image.where(category: "Collares").reverse_order
    end
    
    def pulseras
      @pulseras = Image.where(category: "Pulseras").reverse_order
    end
    
    def novedades
      @novedades = Image.where(category: "Novedades").reverse_order
    end
    
    def otros
    end
    
end
