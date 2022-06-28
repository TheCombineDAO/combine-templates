::  TODO
::  nav frame
::  make nav links work
/-  *pipe, *post, store=graph-store, metadata-store
/+  *pipe-render, cram, imgur
^-  $-(site-inputs website)
|=  sinp=site-inputs
^-  website
::  reorganize this so that it creates a list of pages 
::  and then adds them all to the website structure at once
|^  =/  sn=manx  (side-nav posts.sinp path.binding.sinp)
    ::  homepage
    ::  index page
    ::  article build
    ::  build website
    =/  [previews=marl pages=website]
      %+  roll  posts.sinp
      |=  $:  [initial=@da =post comments=(list post)]
              [previews=marl pages=website]
          ==
      =/  [path=@t pre=manx page=[mime (unit tang)]]
        %:  article-build
            name.sinp
            binding.sinp
            initial
            post
            comments
            association.sinp
            email.sinp
            width.sinp
            lit.sinp
            sn
        == 
      :-  (snoc previews pre)
      (~(put by pages) path [-.page +.page ~])
    =/  m  (index-page sinp previews sn)
    (~(put by pages) '/' [m ~ ~])
::
++  get-text
  |=  contents=(list content)
  ^-  @t
  ?:  =(~ contents)  ''
  %-  of-wain:format
  %+  roll  contents  
  |=  [c=content w=wain]
  ?+  -.c  (snoc w '')
    %text  (snoc w text.c)
    %mention  (snoc w (scot %p ship.c))
    %url  (snoc w url.c)
  ==
::
+$  article-inputs
  $:  name=term
      =binding:eyre
      initial=@da
      =post
      comments=(list post)
      =association:metadata-store
      email=?
      width=?(%1 %2 %3)
      lit=?
      side-nav=manx
  ==
::
++  index-page
  |=  [si=site-inputs previews=marl side-nav=manx]
  ^-  mime
  =/  home-url  (spud path.binding.si)
  :-  [%text %html ~]
  %-  as-octt:mimes:html
  %+  welp  "<!doctype html>"
  %-  en-xml:html
  ;html
    ;head
      ;meta(charset "utf-8");
      ;title: The Combine Blog
      ;meta(name "viewport", content "width=device-width, initial-scale=1, maximum-scale=1");
      ;link(rel "stylesheet", href "https://rsms.me/inter/inter.css");
      ;link(href "https://storage.googleapis.com/the-combine/styles.css", rel "stylesheet");
    ==
    ;+  %^  frame  lit.si  width.si
    ;=  ;*  ~[(header binding.si title.metadatum.association.si lit.si)]
        ;div(class "layout flex justify-center lg:justify-between")
          ;div(class "layout-narrow px-4 md:px-8 lg:px-0 lg:w-3/4")
            ;h1(class "py-20"): Blog 
            ;*  previews
            ;*  ~[bottom-nav]
          ==
          ;*  ~[side-nav]
        ==
    ==
  ==
::
++  nav-item
  |=  [[@da =post (list post)] home=tape]
  ^-  [manx tape]
  =/  title=content  (snag 0 contents.post)
  ?>  ?=(%text -.title)
  =/  url=tape  ;:(weld home "/" (trip (strip-title text.title)))
  :-  ;li(class "mb-2")
        ;a(href url, class "font-semibold text-green-400")
          {(trip text.title)}
        ==
      ==
    home
++  side-nav
  |=  [posts=(list [@da post (list post)]) pax=path]
  =/  home-url  (spud pax)
  ^-  manx
  ;aside(class "index-sidebar")
    ;h3(class "mb-5"): Index
    ;ul
      ;*  p:(spin posts home-url nav-item)
    ==
  ==
::
++  bottom-nav
    =/  anchor-class  ;:  weld
                          "px-4" 
                          "py-2" 
                          "font-semibold"
                          "rounded-lg"
                          "bg-wall-200"
                          "hover:bg-green-400"
                          "hover:text-white"
                      ==
    ;div(class "mt-5 flex items-center justify-left space-x-1")
      ;a(href "#", class anchor-class): Previous
      ;a(href "#", class anchor-class): 1
      ;a(href "#", class anchor-class): 2
      ;a(href "#", class anchor-class): 3
      ;a(href "#", class anchor-class): Next
    ==
::
::  create the body
++  frame
  |=  [lit=? width=?(%1 %2 %3) m=marl]
  ^-  manx
  ;body
     ;div(class "flex flex-col min-h-screen w-full items-center")
       ;*  m
     ==
    ;footer(class "bg-wall-100 mt-20 p-10 w-full flex justify-center")
      ;div(class "w-1/2 md:w-1/3 flex flex-col flex-shrink")
        ;a(href "mailto:info@the-combine.org")
          info@the-combine.org
        ==
      ==
    ==
  ==
::
++  header
  |=  [=binding:eyre title=@t lit=?]
  ^-  manx
  =/  home-url  (spud path.binding)
  :: TODO make this narrower
  ;header(class "layout w-full flex justify-between items-center px-4 md:px-6 lg:px-0 pt-8 md:pt-10 lg:pt-12 pb-10 md:pb-12 lg:pb-24 z-10")
    ;div
      :: taking this back to the static site for now
      ::;a(href home-url, class "font-semibold text-lg"): The Combine DAO
      ;a(href "https://the-combing.org", class "font-semibold text-lg"): The Combine DAO
    ==
    ;nav(class "items-center hidden md:flex")
      ;a(href "https://the-combine.org/#teams", class "font-semibold text-lg mr-5 text-wall-500"): For Teams
      ;a(href "https://the-combine.org/#partners", class "font-semibold text-lg mr-5 text-wall-500"): For Partners
      ;a(href home-url, class "font-semibold text-lg mr-5 text-wall-500"): Blog
      ;a(href "https://urbit.org/groups/~famreb-todmec/the-combine-public", class "inline-block")
        ;button(class "bg-green-400 text-white flex px-4 py-1 rounded-lg font-semibold")
          Join the Group
        ==
      ==
    ==
  ==
::
++  details
  |=  [when=@da who=@p]
  ^-  manx
  =/  t=tape
    %-  trip
    %:  rap  3
      'Posted on ' 
      (print-date when)
      ' by '
      (scot %p who)
      ~
    ==
  ;p(class "gray fw4", style "margin-block-end: 0;"): {t}
::
++  article-build
  |=  ai=article-inputs
  ^-  [@t manx mime (unit tang)]
  =/  [con=marl err=(unit tang)]  (contents-to-marl (slag 1 contents.post.ai))
  =/  title=content  (snag 0 contents.post.ai)
  ?>  ?=(%text -.title)
  :*  (cat 3 '/' (strip-title text.title))
      (article-preview ai con text.title)
      (article-page ai con text.title)
      err
  ==
::
++  article-preview
  |=  [ai=article-inputs con=marl title=@t]
  ^-  manx
  =/  url=tape
    %-  trip
    ?~  path.binding.ai
      (cat 3 '/' (strip-title title))
    (rap 3 (spat path.binding.ai) '/' (strip-title title) ~)
  ;article(class "pb-20")
    ;header(class "mb-5")
      ;h2
        ;a(href url, class "text-green-400"): {(trip title)}
      ==
      ;div
        ;+  (details initial.ai author.post.ai)
      ==
    ==
    ;main(class "lg:max-w-xl")
      ;*  con
    ==
  ==
::
++  article-page
  |=  [ai=article-inputs con=marl title=@t]
  ^-  mime
  =/  home-url  (spud path.binding.ai)
  =/  snippet=(unit @t)  (snip contents.post.ai)
  =/  prev-img
    ?~  (imgur (get-text contents.post.ai))  ''  (snag 0 (imgur (get-text contents.post.ai)))
 ::
  ::
  ::
  :-  [%text %html ~]
  %-  as-octt:mimes:html
  %+  welp  "<!doctype html>"
  %-  en-xml:html
  ;html
    ;head
      ;meta(charset "utf-8");
      ;meta(name "viewport", content "width=device-width, initial-scale=1, maximum-scale=1");
      :: twitter card info
      ;meta(name "twitter:card", content "summary_large_image");
      ;meta(name "twitter:title", content "{(trip title)}");
      ;meta(name "twitter:image", content "{(trip prev-img)}");
      ;meta(name "twitter:description", content "{(trip (fall snippet title))}");
      ;link(rel "stylesheet", href "https://rsms.me/inter/inter.css");
      ;link(href "https://storage.googleapis.com/the-combine/styles.css", rel "stylesheet");
      ;meta(name "viewport", content "width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0");
      ;title: {(trip title)} • by {(trip (scot %p author.post.ai))}
    ==
    ;+  %^  frame  lit.ai  width.ai
    ;=  ;*  ~[(header binding.ai title.metadatum.association.ai lit.ai)]
        ;div(class "layout flex justify-center lg:justify-between")
          ;div(class "layout-narrow px-4 md:px-8 lg:px-0 lg:w-3/4")
            ::
            ;article(class "pb-20")
              ;header(class "mb-5")
                ;h1(class "py-20"): {(trip title)}
                ;div
                  ;+  (details initial.ai author.post.ai)
                ==
              ==
              ;main(class "lg:max-w-xl")
                ;*  con
              ==
            ==
            :: this is displaying weird and probably need a better one
            :: for single page
            ::;*  ~[bottom-nav]
          ==
          ;*  ~[side-nav.ai]
        ==
    ==
  ==
::
++  single-comment
  |=  p=post
  ^-  manx
  =/  deets=tape
    %-  trip
    %:  rap  3
      (print-date time-sent.p)  ' • '
      (scot %p author.p)
      ~
    ==
  =/  body  (snag 0 contents.p)
  ?>  ?=(%text -.body)
  ;div(class "flex flex-column w-100 ml3")
    ;p(class "gray f7 ma0 mt3", style "margin-block-end: 0;"): {deets}
    ;p(class "f6 ma0 mt1"): {(trip text.body)}
  ==
--
