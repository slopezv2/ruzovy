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

    post 'cargar_imagen/' => 'administracion#cargar_imagen', as: 'cargar_imagen'

    delete 'borrar_imagen/:id' => 'administracion#borrar_imagen', as: 'borrar_imagen'

    delete 'cerrar_sesion/' => 'administracion#cerrar_sesion', as: 'cerrar_sesion'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
