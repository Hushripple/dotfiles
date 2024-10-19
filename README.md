# Importante

Mencionar que la gran mayoría de estas configuraciones las realicé gracias a [bugswriter](https://github.com/bugswriter) y a su [ Linux Ricing Crash Course (minimal, simple yet pretty rice for newbies) ](https://www.youtube.com/watch?v=SRqVuAUP2N0)
con un par de modificaciones pequeñas por mi parte.

Si expliqué algo mal y no funciona como lo especifico, ver el video de bugswritter o buscar sus repos.

# .xinitrc
![xinitrc](https://cdn.discordapp.com/attachments/1287597164436000898/1297214782549659658/xinitrc-example.png?ex=67151ce9&is=6713cb69&hm=cbb4910aedd2942a7e0ba66aa229ab0866e38cfe2443d9af986fcbe09a3e0d44&)

Lo más relevante de este .xinitrc son las líneas para establecer el wallpaper y el colorscheme, y lo que se debe ejecutar:

```
xwallpaper --zoom 'Imágenes/wallpaper3.png'
wal -i 'Imágenes/wallpaper3.png'
```

Se necesita ``` sudo pacman -S xwallpaper ``` y ``` sudo pacman -S python-pywal ``` para que funcione.

**xwallpaper** sirve para establecer una imágen como wallpaper y cuenta con algunas configuraciones. **python-pywal/wal -i** es para establecer el colorscheme en base a una imágen.

Si el colorscheme no se está guardando correctamente luego de hacer ``` source .xinitrc ```, es probable que sea problema del caché de pywal. En ese caso hacer ``` rm -rf .cache/wal ``` para eliminar la caché. 

Finalmente apretar **MODKEY + F5** para que se aplique correctamente el colorscheme.

Hay formas de automatizar esto, pero soy muy flojo para hacerlo y mi configuración funciona sin problemas.

Los programas que se ejecutan en el .xinitrc son los siguientes:

```
dwmblocks &
xcompmgr &
exec dwm
```

Se necesita ``` sudo pacman -S xcompmgr ``` para darle el efecto de transparencia a la terminal (st con ohmyzsh)

Ya que utilizo dwm, al final de todo el archivo se debe hacer ```exec dwm```

# .zshrc y ohmyzsh

Utilizo zsh con ![ohmyzsh](https://ohmyz.sh/). Lo más relevante de este archivo es el tema establecido, el export y un alias.

Honestamente me da flojera explicar cómo establecer zsh y ohmyzsh...


Establece alanpeabody como tema para zsh
``` 
ZSH_THEME="alanpeabody"
```
Luego, dentro de **.oh-my-zsh/themes** se puede editar el tema establecido con ``` vim alanpeabody.zsh-theme ``` para una mejor configuración.

Sin embargo, ya que se está utilizando pywal para manejar la colorscheme, esto es irrelevante si se quiere configurar un color en específico.

Lo que sí se puede modificar es el prompt; en mi caso lo tengo así:

``` 
PROMPT="[${user} ${pwd}]$ "
```

Necesario para poder encontrar los scripts utilizados en dwmblocks:
``` 
export PATH=$HOME/.local/bin:$PATH
```

Alias para que **ls** muestre los archivos ocultos/dotfiles:
``` 
alias ls='ls -a --color=auto'
```

# dwmblocks y bin

![dwmblocks](https://cdn.discordapp.com/attachments/1287597164436000898/1297222399082631288/dwmblocks-example-2.png?ex=67152401&is=6713d281&hm=3286c514c822f1f3b797981f7e3d2bbcea2f1677ec64ac23e4967c389f7d98f9&)

El propósito de .local/bin es guardar ahí los scripts que se quieran utilizar en dwmblocks, los cuales saco de ![este repositorio de Luke Smith](https://github.com/LukeSmithxyz/voidrice/tree/master/.local/bin/statusbar)

El proceso para todo esto es buscar en su repositorio lo que queramos utilizar en nuestro dwmblocks, acceder al raw y:

```
cd .local/bin
wget https://raw.githubusercontent.com/LukeSmithxyz/voidrice/refs/heads/master/.local/bin/statusbar/sb-battery
mv sb-battery battery
chmod +x battery
```

``` mv sb-battery battery ``` cambia el nombre del archivo a simplemente "battery" para que sea más sencillo de utilizar, aunque no es necesario.

``` chmod +x battery ``` convierte el archivo en un script ejecutable, lo cual es necesario para poder utilizarlo.

Luego de hacer esto, podemos editar el script a nuestra preferencia

```
vim battery
```

![dwmblocks2](https://cdn.discordapp.com/attachments/1287597164436000898/1297206008673861743/bin-example.png?ex=671514bd&is=6713c33d&hm=44688874291f62e4b9d0221dd2ab22d2bb69a2eb3f7d2db0031e503f2b3d07fb&)

Un paso necesario e importante para su correcto funcionamiento es hacer que el sistema pueda encontrar, reconocer y ejecutar estos scripts desde cualquier parte. Para esto, en mi caso, se debe incluir la siguiente linea al final de .zshrc:

```
export PATH=$HOME/.local/bin:$PATH
```

Se puede testear y verificar que los scripts estén mostrándose y funcionando correctamente antes de incluirlos en el config.h simplemente escribiendo el nombre del script en la terminal:

![bin](https://cdn.discordapp.com/attachments/1287597164436000898/1297208970066526270/bin-example-2.png?ex=6715177f&is=6713c5ff&hm=077e21277cbdd06228b90a7570d00bdbc2254482f87a5314fa6b429560fa95da&)


Para agregar los scripts a dwmblocks, se debe editar el archivo **config.h** que se encuentra dentro de la carpeta de dwmblocks:

![dwmblocks3](https://cdn.discordapp.com/attachments/1287597164436000898/1297212310506569839/dwmblocks-example.png?ex=67151a9b&is=6713c91b&hm=aa3a095511a2d7e8b32be731825e96203662baf7fd6fa8639f0e1e069d9af13c&)

Como se puede ver en la imágen, es bastante intuitivo y muy fácil de setear. 

Finalmente, se debe hacer un ``` sudo make clean install ```. Si los cambios no se muestran, probablemente sea necesario matar el proceso con ```pkill dwmblocks``` y volver a ejecutarlo mediante ```dwmblocks &``` o reiniciando el sistema.

# .vimrc


.vimrc es el archivo de configuración para vim. Dentro de él se encuentran una serie de instrucciones y configuraciones comentadas para que vim funcione un poco mejor. Ya que sólo lo utilizo para .configs y archivos simples ocasionalmente, no tiene plugins tan avanzados, aunque se planea transformar en un IDE completamente funcional en el futuro.

Se deben crear esta serie de carpetas en el home. Además, este archivo .vimrc también debe estar en el home.

``` 
mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged
```

Todas estas configuraciones fueron sacadas de ![acá](https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/)

No hay mucho que decir sobre esto, está comentado (en inglés) lo que hace cada configuración. 

Lo más relevante que podría decir es que utiliza NERDTree con vim dev-icons, y para que estos iconos se vean bien es necesario establecer una fuente que soporte iconos. En mi caso utilizo ![ttf-jetbrains-mono-nerd](https://archlinux.org/packages/extra/any/ttf-jetbrains-mono-nerd/)

Para establecer esta fuente, hay que editar el **config.h** de st (la terminal que utilizo) y hacer:

```
static char *font = "JetBrainsMono Nerd Font:pixelsize=15:antialias=true:au
``` 

![vimrc](https://cdn.discordapp.com/attachments/1287597164436000898/1297232391101878282/vimrc-example.png?ex=67152d4f&is=6713dbcf&hm=56472a2345b078ea23d071fda4e380e953ad497105cf7cf822b8f5452e5d51ed&)

# TODO

- Configuraciones de dwm y lo que modifiqué específicamente
- Verificar que expliqué todo correctamente

![ryoarch](https://cdn.discordapp.com/attachments/1287597164436000898/1297234941670719600/Ryo_Yamada_Reading_ArchLinux_Book.jpg?ex=67152faf&is=6713de2f&hm=ca90b0802582e44e25d46a215033b3cb7594d22df104498797b314cdb22f960a&)


