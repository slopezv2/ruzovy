Rails.application.routes.draw do
  get 'administracion/login'

  get 'administracion/agregar_fotos'

  get 'administracion/fotos'

  get 'store/products'

  get 'store/contact'

  get 'store/single'

  get 'store/typo'

  root 'welcome#index'
    
    get 'store/anillos'
    
    get 'store/aretas'
    
    get 'store/collares'
    
    get 'store/pulseras'
    
    get 'store/novedades'
    
    get 'store/otros'
    post 'autenticar/' => 'administracion#autenticar', as: 'login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
