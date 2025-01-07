# Documentation
|Type|description|
|---|---|
|[BeforeUnloadEvent](#BeforeUnloadEvent)||
|[BlurEvent](#BlurEvent)||
|[CSSStyleDeclaration](#CSSStyleDeclaration)||
|[Document](#Document)||
|[Element](#Element)||
|[FocusEvent](#FocusEvent)||
|[HtmlInputElement](#HtmlInputElement)||
|[HtmlTextAreaElement](#HtmlTextAreaElement)||
|[InputEvent](#InputEvent)||
|[JsValue](#JsValue)||
|[KeyboardEvent](#KeyboardEvent)||
|[KeyboardEventInit](#KeyboardEventInit)| need to init function first before creating real event|
|[LocalStorage](#LocalStorage)||
|[Location](#Location)| https://developer.mozilla.org/en-US/docs/Web/API/Location|
|[MouseEvent](#MouseEvent)||
|[Navigator](#Navigator)| \`window.navigator\` object|
|[Node](#Node)| DOM Node type|
|[Performance](#Performance)||
|[Promise](#Promise)||
|[URLSearchParams](#URLSearchParams)| https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams|
|[Window](#Window)| window|

|Value|description|
|---|---|
|[before\_unload\_event](#before_unload_event)||
|[debugger](#debugger)||
|[error\_log](#error_log)||
|[load\_my\_window](#load_my_window)| this file contains dirty functions that Respo requires to call js|
|[log](#log)||
|[new\_url\_search\_params](#new_url_search_params)||
|[random\_id](#random_id)| a temporary solution for generating random id|
|[warn\_log](#warn_log)||
|[window](#window)||

## BeforeUnloadEvent

```moonbit
:::source,tiye/dom-ffi/lib/window.mbt,36:::pub(all) type BeforeUnloadEvent
```


## BlurEvent

```moonbit
:::source,tiye/dom-ffi/lib/event.mbt,110:::pub(all) type BlurEvent
```


## CSSStyleDeclaration

```moonbit
:::source,tiye/dom-ffi/lib/style.mbt,2:::pub(all) type CSSStyleDeclaration
```


#### mooncakes-io-method-mark-Methods
- #### remove\_property
  ```moonbit
  :::source,tiye/dom-ffi/lib/style.mbt,16:::fn <a href="tiye/dom-ffi/lib#CSSStyleDeclaration">CSSStyleDeclaration</a>::remove_property(self : <a href="tiye/dom-ffi/lib#CSSStyleDeclaration">CSSStyleDeclaration</a>, name : String) -> Unit
  ```
  > 
- #### set\_property
  ```moonbit
  :::source,tiye/dom-ffi/lib/style.mbt,8:::fn <a href="tiye/dom-ffi/lib#CSSStyleDeclaration">CSSStyleDeclaration</a>::set_property(self : <a href="tiye/dom-ffi/lib#CSSStyleDeclaration">CSSStyleDeclaration</a>, name : String, value : String) -> Unit
  ```
  > 

## Document

```moonbit
:::source,tiye/dom-ffi/lib/document.mbt,1:::pub(all) type Document
```


#### mooncakes-io-method-mark-Methods
- #### body
  ```moonbit
  :::source,tiye/dom-ffi/lib/document.mbt,7:::fn <a href="tiye/dom-ffi/lib#Document">Document</a>::body(self : <a href="tiye/dom-ffi/lib#Document">Document</a>) -> <a href="tiye/dom-ffi/lib#Element">Element</a>
  ```
  > 
- #### create\_element
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,247:::fn <a href="tiye/dom-ffi/lib#Document">Document</a>::create_element(self : <a href="tiye/dom-ffi/lib#Document">Document</a>, name : String) -> <a href="tiye/dom-ffi/lib#Element">Element</a>
  ```
  > 
- #### head
  ```moonbit
  :::source,tiye/dom-ffi/lib/document.mbt,11:::fn <a href="tiye/dom-ffi/lib#Document">Document</a>::head(self : <a href="tiye/dom-ffi/lib#Document">Document</a>) -> <a href="tiye/dom-ffi/lib#Element">Element</a>
  ```
  > 
- #### query\_selector
  ```moonbit
  :::source,tiye/dom-ffi/lib/document.mbt,14:::fn <a href="tiye/dom-ffi/lib#Document">Document</a>::query_selector(self : <a href="tiye/dom-ffi/lib#Document">Document</a>, selector : String) -> <a href="tiye/dom-ffi/lib#Element">Element</a>
  ```
  > 

## Element

```moonbit
:::source,tiye/dom-ffi/lib/node.mbt,23:::pub(all) type Element
```


#### mooncakes-io-method-mark-Methods
- #### append\_child
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,61:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::append_child(self : <a href="tiye/dom-ffi/lib#Element">Element</a>, child : <a href="tiye/dom-ffi/lib#Node">Node</a>) -> Unit
  ```
  > 
- #### data\_attribute
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,55:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::data_attribute(self : <a href="tiye/dom-ffi/lib#Element">Element</a>, name : String) -> String
  ```
  > 
- #### dirty\_get\_attribute\_fn
  ```moonbit
  :::source,tiye/dom-ffi/lib/respo-dirty.mbt,51:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::dirty_get_attribute_fn(self : <a href="tiye/dom-ffi/lib#Element">Element</a>, name : String) -> (() -> Bool)
  ```
  > 
- #### dirty\_remove\_attribute\_fn
  ```moonbit
  :::source,tiye/dom-ffi/lib/respo-dirty.mbt,66:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::dirty_remove_attribute_fn(self : <a href="tiye/dom-ffi/lib#Element">Element</a>, name : String) -> Unit
  ```
  > 
- #### dirty\_set\_attribute\_fn
  ```moonbit
  :::source,tiye/dom-ffi/lib/respo-dirty.mbt,58:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::dirty_set_attribute_fn(self : <a href="tiye/dom-ffi/lib#Element">Element</a>, name : String, f : (<a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> Bool) -> Unit
  ```
  > 
- #### focus
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,265:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::focus(self : <a href="tiye/dom-ffi/lib#Element">Element</a>) -> Unit
  ```
  > 
- #### insert\_before
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,200:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::insert_before(self : <a href="tiye/dom-ffi/lib#Element">Element</a>, new_child : <a href="tiye/dom-ffi/lib#Node">Node</a>, reference_child : <a href="tiye/dom-ffi/lib#Node">Node</a>) -> Unit
  ```
  > 
- #### query\_selector
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,240:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::query_selector(self : <a href="tiye/dom-ffi/lib#Element">Element</a>, selector : String) -> <a href="tiye/dom-ffi/lib#Element">Element</a>
  ```
  > 
- #### reinterpret\_as\_html\_input\_element
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,114:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::reinterpret_as_html_input_element(self : <a href="tiye/dom-ffi/lib#Element">Element</a>) -> <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>
  ```
  > 
- #### reinterpret\_as\_html\_textarea\_element
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,207:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::reinterpret_as_html_textarea_element(self : <a href="tiye/dom-ffi/lib#Element">Element</a>) -> <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>
  ```
  > 
- #### reinterpret\_as\_node
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,16:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::reinterpret_as_node(self : <a href="tiye/dom-ffi/lib#Element">Element</a>) -> <a href="tiye/dom-ffi/lib#Node">Node</a>
  ```
  > 
- #### remove\_attribute
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,45:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::remove_attribute(self : <a href="tiye/dom-ffi/lib#Element">Element</a>, name : String) -> Unit
  ```
  > 
- #### remove\_data\_attribute
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,58:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::remove_data_attribute(self : <a href="tiye/dom-ffi/lib#Element">Element</a>, name : String) -> Unit
  ```
  > 
- #### set\_attribute
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,37:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::set_attribute(self : <a href="tiye/dom-ffi/lib#Element">Element</a>, name : String, value : String) -> Unit
  ```
  > 
- #### set\_data\_attribute
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,48:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::set_data_attribute(self : <a href="tiye/dom-ffi/lib#Element">Element</a>, name : String, value : String) -> Unit
  ```
  > 
- #### set\_html\_for
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,31:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::set_html_for(self : <a href="tiye/dom-ffi/lib#Element">Element</a>, html : String) -> Unit
  ```
  > 
- #### set\_inner\_html
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,25:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::set_inner_html(self : <a href="tiye/dom-ffi/lib#Element">Element</a>, html : String) -> Unit
  ```
  > 
- #### set\_inner\_text
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,28:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::set_inner_text(self : <a href="tiye/dom-ffi/lib#Element">Element</a>, text : String) -> Unit
  ```
  > 
- #### set\_onclick
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,221:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::set_onclick(self : <a href="tiye/dom-ffi/lib#Element">Element</a>, f : (<a href="tiye/dom-ffi/lib#MouseEvent">MouseEvent</a>) -> Unit) -> Unit
  ```
  > 
- #### set\_ondblclick
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,231:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::set_ondblclick(self : <a href="tiye/dom-ffi/lib#Element">Element</a>, f : (<a href="tiye/dom-ffi/lib#MouseEvent">MouseEvent</a>) -> Unit) -> Unit
  ```
  > 
- #### tag\_name
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,34:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::tag_name(self : <a href="tiye/dom-ffi/lib#Element">Element</a>) -> String
  ```
  > 
- #### unset\_onclick
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,227:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::unset_onclick(self : <a href="tiye/dom-ffi/lib#Element">Element</a>) -> Unit
  ```
  > 
- #### unset\_ondblclick
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,237:::fn <a href="tiye/dom-ffi/lib#Element">Element</a>::unset_ondblclick(self : <a href="tiye/dom-ffi/lib#Element">Element</a>) -> Unit
  ```
  > 

## FocusEvent

```moonbit
:::source,tiye/dom-ffi/lib/event.mbt,108:::pub(all) type FocusEvent
```


## HtmlInputElement

```moonbit
:::source,tiye/dom-ffi/lib/node.mbt,112:::pub(all) type HtmlInputElement
```


#### mooncakes-io-method-mark-Methods
- #### set\_onblur
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,122:::fn <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>::set_onblur(self : <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>, f : (<a href="tiye/dom-ffi/lib#BlurEvent">BlurEvent</a>) -> Unit?) -> Unit
  ```
  > 
- #### set\_onchange
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,150:::fn <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>::set_onchange(self : <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>, f : (<a href="tiye/dom-ffi/lib#InputEvent">InputEvent</a>) -> Unit?) -> Unit
  ```
  > 
- #### set\_onfocus
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,129:::fn <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>::set_onfocus(self : <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>, f : (<a href="tiye/dom-ffi/lib#FocusEvent">FocusEvent</a>) -> Unit?) -> Unit
  ```
  > 
- #### set\_oninput
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,164:::fn <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>::set_oninput(self : <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>, f : (<a href="tiye/dom-ffi/lib#InputEvent">InputEvent</a>) -> Unit) -> Unit
  ```
  > 
- #### set\_onkeydown
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,79:::fn <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>::set_onkeydown(self : <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>, f : (<a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> Unit?) -> Unit
  ```
  > 
- #### set\_onkeypress
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,65:::fn <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>::set_onkeypress(self : <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>, f : (<a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> Unit?) -> Unit
  ```
  > 
- #### set\_onkeyup
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,93:::fn <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>::set_onkeyup(self : <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>, f : (<a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> Unit?) -> Unit
  ```
  > 
- #### set\_value
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,183:::fn <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>::set_value(self : <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>, value : String) -> Unit
  ```
  > 
- #### unset\_oninput
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,170:::fn <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>::unset_oninput(self : <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>) -> Unit
  ```
  > 
- #### value
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,180:::fn <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>::value(self : <a href="tiye/dom-ffi/lib#HtmlInputElement">HtmlInputElement</a>) -> String
  ```
  > 

## HtmlTextAreaElement

```moonbit
:::source,tiye/dom-ffi/lib/node.mbt,119:::pub(all) type HtmlTextAreaElement
```


#### mooncakes-io-method-mark-Methods
- #### set\_onblur
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,136:::fn <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>::set_onblur(self : <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>, f : (<a href="tiye/dom-ffi/lib#BlurEvent">BlurEvent</a>) -> Unit?) -> Unit
  ```
  > 
- #### set\_onchange
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,157:::fn <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>::set_onchange(self : <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>, f : (<a href="tiye/dom-ffi/lib#InputEvent">InputEvent</a>) -> Unit?) -> Unit
  ```
  > 
- #### set\_onfocus
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,143:::fn <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>::set_onfocus(self : <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>, f : (<a href="tiye/dom-ffi/lib#FocusEvent">FocusEvent</a>) -> Unit?) -> Unit
  ```
  > 
- #### set\_oninput
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,174:::fn <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>::set_oninput(self : <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>, f : (<a href="tiye/dom-ffi/lib#InputEvent">InputEvent</a>) -> Unit?) -> Unit
  ```
  > 
- #### set\_onkeydown
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,86:::fn <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>::set_onkeydown(self : <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>, f : (<a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> Unit?) -> Unit
  ```
  > 
- #### set\_onkeypress
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,72:::fn <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>::set_onkeypress(self : <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>, f : (<a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> Unit?) -> Unit
  ```
  > 
- #### set\_onkeyup
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,100:::fn <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>::set_onkeyup(self : <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>, f : (<a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> Unit?) -> Unit
  ```
  > 
- #### set\_value
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,189:::fn <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>::set_value(self : <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>, value : String) -> Unit
  ```
  > 
- #### value
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,186:::fn <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>::value(self : <a href="tiye/dom-ffi/lib#HtmlTextAreaElement">HtmlTextAreaElement</a>) -> String
  ```
  > 

## InputEvent

```moonbit
:::source,tiye/dom-ffi/lib/event.mbt,106:::pub(all) type InputEvent
```


#### mooncakes-io-method-mark-Methods
- #### target
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,262:::fn <a href="tiye/dom-ffi/lib#InputEvent">InputEvent</a>::target(self : <a href="tiye/dom-ffi/lib#InputEvent">InputEvent</a>) -> <a href="tiye/dom-ffi/lib#Element">Element</a>
  ```
  > 

## JsValue

```moonbit
:::source,tiye/dom-ffi/lib/promise.mbt,3:::pub(all) type JsValue
```


#### mooncakes-io-method-mark-Methods
- #### then\_ffi
  ```moonbit
  :::source,tiye/dom-ffi/lib/promise.mbt,9:::fn <a href="tiye/dom-ffi/lib#JsValue">JsValue</a>::then_ffi(self : <a href="tiye/dom-ffi/lib#JsValue">JsValue</a>, f : (<a href="tiye/dom-ffi/lib#JsValue">JsValue</a>) -> <a href="tiye/dom-ffi/lib#JsValue">JsValue</a>) -> <a href="tiye/dom-ffi/lib#Promise">Promise</a>[<a href="tiye/dom-ffi/lib#JsValue">JsValue</a>]
  ```
  > 

## KeyboardEvent

```moonbit
:::source,tiye/dom-ffi/lib/event.mbt,1:::pub(all) type KeyboardEvent
```


#### mooncakes-io-method-mark-Methods
- #### alt\_key
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,30:::fn <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>::alt_key(self : <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> Bool
  ```
  > 
- #### char\_code
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,47:::fn <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>::char_code(self : <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> UInt
  ```
  > 
- #### code
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,44:::fn <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>::code(self : <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> String
  ```
  > 
- #### ctrl\_key
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,26:::fn <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>::ctrl_key(self : <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> Bool
  ```
  > 
- #### key
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,10:::fn <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>::key(self : <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> String
  ```
  > 
- #### key\_code
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,18:::fn <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>::key_code(self : <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> UInt
  ```
  > 
- #### location
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,50:::fn <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>::location(self : <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> UInt
  ```
  > 
- #### meta\_key
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,34:::fn <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>::meta_key(self : <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> Bool
  ```
  > 
- #### new\_with\_init\_dict
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,3:::fn <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>::new_with_init_dict(type_ : String, event_init_dict : <a href="tiye/dom-ffi/lib#KeyboardEventInit">KeyboardEventInit</a>) -> <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>
  ```
  > 
- #### prevent\_default
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,57:::fn <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>::prevent_default(self : <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> Unit
  ```
  > 
- #### repeat
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,38:::fn <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>::repeat(self : <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> Bool
  ```
  > 
- #### set\_repeat
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,64:::fn <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>::set_repeat(self : <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>, repeat : Bool) -> Unit
  ```
  > 
- #### shift\_key
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,22:::fn <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>::shift_key(self : <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> Bool
  ```
  > 
- #### stop\_propagation
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,60:::fn <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>::stop_propagation(self : <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> Unit
  ```
  > 
- #### type\_
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,14:::fn <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>::type_(self : <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> String
  ```
  > 
- #### view
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,41:::fn <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>::view(self : <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> <a href="tiye/dom-ffi/lib#Window">Window</a>
  ```
  > 

## KeyboardEventInit

```moonbit
:::source,tiye/dom-ffi/lib/event.mbt,68:::pub(all) type KeyboardEventInit
```
 need to init function first before creating real event

#### mooncakes-io-method-mark-Methods
- #### new
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,70:::fn <a href="tiye/dom-ffi/lib#KeyboardEventInit">KeyboardEventInit</a>::new() -> <a href="tiye/dom-ffi/lib#KeyboardEventInit">KeyboardEventInit</a>
  ```
  > 
- #### set\_char\_code
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,85:::fn <a href="tiye/dom-ffi/lib#KeyboardEventInit">KeyboardEventInit</a>::set_char_code(self : <a href="tiye/dom-ffi/lib#KeyboardEventInit">KeyboardEventInit</a>, char_code : UInt) -> Unit
  ```
  > 
- #### set\_code
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,82:::fn <a href="tiye/dom-ffi/lib#KeyboardEventInit">KeyboardEventInit</a>::set_code(self : <a href="tiye/dom-ffi/lib#KeyboardEventInit">KeyboardEventInit</a>, code : String) -> Unit
  ```
  > 
- #### set\_key
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,79:::fn <a href="tiye/dom-ffi/lib#KeyboardEventInit">KeyboardEventInit</a>::set_key(self : <a href="tiye/dom-ffi/lib#KeyboardEventInit">KeyboardEventInit</a>, key : String) -> Unit
  ```
  > 
- #### set\_key\_code
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,100:::fn <a href="tiye/dom-ffi/lib#KeyboardEventInit">KeyboardEventInit</a>::set_key_code(self : <a href="tiye/dom-ffi/lib#KeyboardEventInit">KeyboardEventInit</a>, key_code : UInt) -> Unit
  ```
  > 
- #### set\_location
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,94:::fn <a href="tiye/dom-ffi/lib#KeyboardEventInit">KeyboardEventInit</a>::set_location(self : <a href="tiye/dom-ffi/lib#KeyboardEventInit">KeyboardEventInit</a>, location : UInt) -> Unit
  ```
  > 
- #### set\_view
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,91:::fn <a href="tiye/dom-ffi/lib#KeyboardEventInit">KeyboardEventInit</a>::set_view(self : <a href="tiye/dom-ffi/lib#KeyboardEventInit">KeyboardEventInit</a>, view : <a href="tiye/dom-ffi/lib#Window">Window</a>) -> Unit
  ```
  > 

## LocalStorage

```moonbit
:::source,tiye/dom-ffi/lib/storage.mbt,1:::pub(all) type LocalStorage
```


#### mooncakes-io-method-mark-Methods
- #### get\_item
  ```moonbit
  :::source,tiye/dom-ffi/lib/storage.mbt,7:::fn <a href="tiye/dom-ffi/lib#LocalStorage">LocalStorage</a>::get_item(self : <a href="tiye/dom-ffi/lib#LocalStorage">LocalStorage</a>, key : String) -> String?
  ```
  >  TODO undefined is used to trick `String?` type, need more solid solution
- #### remove\_item
  ```moonbit
  :::source,tiye/dom-ffi/lib/storage.mbt,17:::fn <a href="tiye/dom-ffi/lib#LocalStorage">LocalStorage</a>::remove_item(self : <a href="tiye/dom-ffi/lib#LocalStorage">LocalStorage</a>, key : String) -> Unit
  ```
  > 
- #### set\_item
  ```moonbit
  :::source,tiye/dom-ffi/lib/storage.mbt,10:::fn <a href="tiye/dom-ffi/lib#LocalStorage">LocalStorage</a>::set_item(self : <a href="tiye/dom-ffi/lib#LocalStorage">LocalStorage</a>, key : String, value : String) -> Unit
  ```
  > 

## Location

```moonbit
:::source,tiye/dom-ffi/lib/location.mbt,2:::pub(all) type Location
```
 https://developer.mozilla.org/en-US/docs/Web/API/Location

#### mooncakes-io-method-mark-Methods
- #### assign
  ```moonbit
  :::source,tiye/dom-ffi/lib/location.mbt,37:::fn <a href="tiye/dom-ffi/lib#Location">Location</a>::assign(self : <a href="tiye/dom-ffi/lib#Location">Location</a>, url : String) -> Unit
  ```
  > 
- #### hash
  ```moonbit
  :::source,tiye/dom-ffi/lib/location.mbt,31:::fn <a href="tiye/dom-ffi/lib#Location">Location</a>::hash(self : <a href="tiye/dom-ffi/lib#Location">Location</a>) -> String
  ```
  > 
- #### host
  ```moonbit
  :::source,tiye/dom-ffi/lib/location.mbt,16:::fn <a href="tiye/dom-ffi/lib#Location">Location</a>::host(self : <a href="tiye/dom-ffi/lib#Location">Location</a>) -> String
  ```
  > 
- #### hostname
  ```moonbit
  :::source,tiye/dom-ffi/lib/location.mbt,19:::fn <a href="tiye/dom-ffi/lib#Location">Location</a>::hostname(self : <a href="tiye/dom-ffi/lib#Location">Location</a>) -> String
  ```
  > 
- #### href
  ```moonbit
  :::source,tiye/dom-ffi/lib/location.mbt,7:::fn <a href="tiye/dom-ffi/lib#Location">Location</a>::href(self : <a href="tiye/dom-ffi/lib#Location">Location</a>) -> String
  ```
  > 
- #### origin
  ```moonbit
  :::source,tiye/dom-ffi/lib/location.mbt,34:::fn <a href="tiye/dom-ffi/lib#Location">Location</a>::origin(self : <a href="tiye/dom-ffi/lib#Location">Location</a>) -> String
  ```
  > 
- #### pathname
  ```moonbit
  :::source,tiye/dom-ffi/lib/location.mbt,25:::fn <a href="tiye/dom-ffi/lib#Location">Location</a>::pathname(self : <a href="tiye/dom-ffi/lib#Location">Location</a>) -> String
  ```
  > 
- #### port
  ```moonbit
  :::source,tiye/dom-ffi/lib/location.mbt,22:::fn <a href="tiye/dom-ffi/lib#Location">Location</a>::port(self : <a href="tiye/dom-ffi/lib#Location">Location</a>) -> String
  ```
  > 
- #### protocol
  ```moonbit
  :::source,tiye/dom-ffi/lib/location.mbt,13:::fn <a href="tiye/dom-ffi/lib#Location">Location</a>::protocol(self : <a href="tiye/dom-ffi/lib#Location">Location</a>) -> String
  ```
  > 
- #### reload
  ```moonbit
  :::source,tiye/dom-ffi/lib/location.mbt,40:::fn <a href="tiye/dom-ffi/lib#Location">Location</a>::reload(self : <a href="tiye/dom-ffi/lib#Location">Location</a>) -> Unit
  ```
  > 
- #### replace
  ```moonbit
  :::source,tiye/dom-ffi/lib/location.mbt,43:::fn <a href="tiye/dom-ffi/lib#Location">Location</a>::replace(self : <a href="tiye/dom-ffi/lib#Location">Location</a>, url : String) -> Unit
  ```
  > 
- #### search
  ```moonbit
  :::source,tiye/dom-ffi/lib/location.mbt,28:::fn <a href="tiye/dom-ffi/lib#Location">Location</a>::search(self : <a href="tiye/dom-ffi/lib#Location">Location</a>) -> String
  ```
  > 
- #### set\_href
  ```moonbit
  :::source,tiye/dom-ffi/lib/location.mbt,10:::fn <a href="tiye/dom-ffi/lib#Location">Location</a>::set_href(self : <a href="tiye/dom-ffi/lib#Location">Location</a>, href : String) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,tiye/dom-ffi/lib/location.mbt,46:::fn <a href="tiye/dom-ffi/lib#Location">Location</a>::to_string(self : <a href="tiye/dom-ffi/lib#Location">Location</a>) -> String
  ```
  > 

## MouseEvent

```moonbit
:::source,tiye/dom-ffi/lib/event.mbt,112:::pub(all) type MouseEvent
```


#### mooncakes-io-method-mark-Methods
- #### client\_x
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,121:::fn <a href="tiye/dom-ffi/lib#MouseEvent">MouseEvent</a>::client_x(self : <a href="tiye/dom-ffi/lib#MouseEvent">MouseEvent</a>) -> float
  ```
  > 
- #### client\_y
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,125:::fn <a href="tiye/dom-ffi/lib#MouseEvent">MouseEvent</a>::client_y(self : <a href="tiye/dom-ffi/lib#MouseEvent">MouseEvent</a>) -> float
  ```
  > 
- #### prevent\_default
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,117:::fn <a href="tiye/dom-ffi/lib#MouseEvent">MouseEvent</a>::prevent_default(self : <a href="tiye/dom-ffi/lib#MouseEvent">MouseEvent</a>) -> Unit
  ```
  > 
- #### stop\_propagation
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,114:::fn <a href="tiye/dom-ffi/lib#MouseEvent">MouseEvent</a>::stop_propagation(self : <a href="tiye/dom-ffi/lib#MouseEvent">MouseEvent</a>) -> Unit
  ```
  > 

## Navigator

```moonbit
:::source,tiye/dom-ffi/lib/navigator.mbt,3:::pub(all) type Navigator
```
 `window.navigator` object
https://developer.mozilla.org/en-US/docs/Web/API/Navigator

## Node

```moonbit
:::source,tiye/dom-ffi/lib/node.mbt,3:::pub(all) type Node
```
 DOM Node type
<https://developer.mozilla.org/en-US/docs/Web/API/Node>

#### mooncakes-io-method-mark-Methods
- #### append\_child
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,250:::fn <a href="tiye/dom-ffi/lib#Node">Node</a>::append_child(self : <a href="tiye/dom-ffi/lib#Node">Node</a>, child : <a href="tiye/dom-ffi/lib#Node">Node</a>) -> Unit
  ```
  > 
- #### child\_nodes
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,5:::fn <a href="tiye/dom-ffi/lib#Node">Node</a>::child_nodes(self : <a href="tiye/dom-ffi/lib#Node">Node</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/dom-ffi/lib#Node">Node</a>]
  ```
  > 
- #### children
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,9:::fn <a href="tiye/dom-ffi/lib#Node">Node</a>::children(self : <a href="tiye/dom-ffi/lib#Node">Node</a>) -> <a href="moonbitlang/core/array#Array">Array</a>[<a href="tiye/dom-ffi/lib#Node">Node</a>]
  ```
  > 
- #### clone\_node
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,106:::fn <a href="tiye/dom-ffi/lib#Node">Node</a>::clone_node(self : <a href="tiye/dom-ffi/lib#Node">Node</a>, deep~ : Bool = ..) -> <a href="tiye/dom-ffi/lib#Node">Node</a>
  ```
  > 
- #### dispatch\_event
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,54:::fn <a href="tiye/dom-ffi/lib#Node">Node</a>::dispatch_event(self : <a href="tiye/dom-ffi/lib#Node">Node</a>, event : <a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> Bool
  ```
  > 
- #### first\_child
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,20:::fn <a href="tiye/dom-ffi/lib#Node">Node</a>::first_child(self : <a href="tiye/dom-ffi/lib#Node">Node</a>) -> <a href="tiye/dom-ffi/lib#Node">Node</a>
  ```
  > 
- #### insert\_before
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,254:::fn <a href="tiye/dom-ffi/lib#Node">Node</a>::insert_before(self : <a href="tiye/dom-ffi/lib#Node">Node</a>, new_child : <a href="tiye/dom-ffi/lib#Node">Node</a>, reference_child : <a href="tiye/dom-ffi/lib#Node">Node</a>?) -> Unit
  ```
  > 
- #### owner\_document
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,109:::fn <a href="tiye/dom-ffi/lib#Node">Node</a>::owner_document(self : <a href="tiye/dom-ffi/lib#Node">Node</a>) -> <a href="tiye/dom-ffi/lib#Document">Document</a>
  ```
  > 
- #### parent\_element
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,196:::fn <a href="tiye/dom-ffi/lib#Node">Node</a>::parent_element(self : <a href="tiye/dom-ffi/lib#Node">Node</a>) -> <a href="tiye/dom-ffi/lib#Element">Element</a>
  ```
  > 
- #### reinterpret\_as\_element
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,12:::fn <a href="tiye/dom-ffi/lib#Node">Node</a>::reinterpret_as_element(self : <a href="tiye/dom-ffi/lib#Node">Node</a>) -> <a href="tiye/dom-ffi/lib#Element">Element</a>
  ```
  > 
- #### remove
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,213:::fn <a href="tiye/dom-ffi/lib#Node">Node</a>::remove(self : <a href="tiye/dom-ffi/lib#Node">Node</a>) -> Unit
  ```
  > 
- #### remove\_child
  ```moonbit
  :::source,tiye/dom-ffi/lib/node.mbt,217:::fn <a href="tiye/dom-ffi/lib#Node">Node</a>::remove_child(self : <a href="tiye/dom-ffi/lib#Node">Node</a>, child : <a href="tiye/dom-ffi/lib#Node">Node</a>) -> Unit
  ```
  > 
- #### style
  ```moonbit
  :::source,tiye/dom-ffi/lib/style.mbt,4:::fn <a href="tiye/dom-ffi/lib#Node">Node</a>::style(self : <a href="tiye/dom-ffi/lib#Node">Node</a>) -> <a href="tiye/dom-ffi/lib#CSSStyleDeclaration">CSSStyleDeclaration</a>
  ```
  > 

## Performance

```moonbit
:::source,tiye/dom-ffi/lib/performance.mbt,2:::pub(all) type Performance
```


#### mooncakes-io-method-mark-Methods
- #### now
  ```moonbit
  :::source,tiye/dom-ffi/lib/performance.mbt,8:::fn <a href="tiye/dom-ffi/lib#Performance">Performance</a>::now(self : <a href="tiye/dom-ffi/lib#Performance">Performance</a>) -> float
  ```
  > 

## Promise

```moonbit
:::source,tiye/dom-ffi/lib/promise.mbt,5:::pub(all) struct Promise {
  val : T
}
```


## URLSearchParams

```moonbit
:::source,tiye/dom-ffi/lib/params.mbt,2:::pub(all) type URLSearchParams
```
 https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams

#### mooncakes-io-method-mark-Methods
- #### append
  ```moonbit
  :::source,tiye/dom-ffi/lib/params.mbt,26:::fn <a href="tiye/dom-ffi/lib#URLSearchParams">URLSearchParams</a>::append(self : <a href="tiye/dom-ffi/lib#URLSearchParams">URLSearchParams</a>, name : String, value : String) -> Unit
  ```
  > 
- #### delete
  ```moonbit
  :::source,tiye/dom-ffi/lib/params.mbt,33:::fn <a href="tiye/dom-ffi/lib#URLSearchParams">URLSearchParams</a>::delete(self : <a href="tiye/dom-ffi/lib#URLSearchParams">URLSearchParams</a>, name : String) -> Unit
  ```
  > 
- #### get
  ```moonbit
  :::source,tiye/dom-ffi/lib/params.mbt,10:::fn <a href="tiye/dom-ffi/lib#URLSearchParams">URLSearchParams</a>::get(self : <a href="tiye/dom-ffi/lib#URLSearchParams">URLSearchParams</a>, name : String) -> String
  ```
  > 
- #### get\_all
  ```moonbit
  :::source,tiye/dom-ffi/lib/params.mbt,13:::fn <a href="tiye/dom-ffi/lib#URLSearchParams">URLSearchParams</a>::get_all(self : <a href="tiye/dom-ffi/lib#URLSearchParams">URLSearchParams</a>, name : String) -> <a href="moonbitlang/core/array#Array">Array</a>[String]
  ```
  > 
- #### has
  ```moonbit
  :::source,tiye/dom-ffi/lib/params.mbt,7:::fn <a href="tiye/dom-ffi/lib#URLSearchParams">URLSearchParams</a>::has(self : <a href="tiye/dom-ffi/lib#URLSearchParams">URLSearchParams</a>, name : String) -> Bool
  ```
  > 
- #### set
  ```moonbit
  :::source,tiye/dom-ffi/lib/params.mbt,19:::fn <a href="tiye/dom-ffi/lib#URLSearchParams">URLSearchParams</a>::set(self : <a href="tiye/dom-ffi/lib#URLSearchParams">URLSearchParams</a>, name : String, value : String) -> Unit
  ```
  > 
- #### to\_string
  ```moonbit
  :::source,tiye/dom-ffi/lib/params.mbt,36:::fn <a href="tiye/dom-ffi/lib#URLSearchParams">URLSearchParams</a>::to_string(self : <a href="tiye/dom-ffi/lib#URLSearchParams">URLSearchParams</a>) -> String
  ```
  > 

## Window

```moonbit
:::source,tiye/dom-ffi/lib/window.mbt,2:::pub(all) type Window
```
 window

#### mooncakes-io-method-mark-Methods
- #### add\_event\_listener\_with\_callback
  ```moonbit
  :::source,tiye/dom-ffi/lib/window.mbt,8:::fn <a href="tiye/dom-ffi/lib#Window">Window</a>::add_event_listener_with_callback(self : <a href="tiye/dom-ffi/lib#Window">Window</a>, type_ : String, f : (<a href="tiye/dom-ffi/lib#KeyboardEvent">KeyboardEvent</a>) -> Bool) -> Unit
  ```
  > 
- #### dirty\_call\_fn
  ```moonbit
  :::source,tiye/dom-ffi/lib/respo-dirty.mbt,16:::fn <a href="tiye/dom-ffi/lib#Window">Window</a>::dirty_call_fn(self : <a href="tiye/dom-ffi/lib#Window">Window</a>, name : String) -> Unit
  ```
  > 
- #### dirty\_call\_fn\_1
  ```moonbit
  :::source,tiye/dom-ffi/lib/respo-dirty.mbt,39:::fn <a href="tiye/dom-ffi/lib#Window">Window</a>::dirty_call_fn_1(self : <a href="tiye/dom-ffi/lib#Window">Window</a>, name : String, v1 : String) -> Unit
  ```
  > 
- #### dirty\_get\_fn
  ```moonbit
  :::source,tiye/dom-ffi/lib/respo-dirty.mbt,8:::fn <a href="tiye/dom-ffi/lib#Window">Window</a>::dirty_get_fn(self : <a href="tiye/dom-ffi/lib#Window">Window</a>, name : String) -> (() -> Unit)
  ```
  > 
- #### dirty\_get\_fn\_1
  ```moonbit
  :::source,tiye/dom-ffi/lib/respo-dirty.mbt,24:::fn <a href="tiye/dom-ffi/lib#Window">Window</a>::dirty_get_fn_1(self : <a href="tiye/dom-ffi/lib#Window">Window</a>, name : String) -> ((String) -> Unit)
  ```
  > 
- #### dirty\_remove\_fn
  ```moonbit
  :::source,tiye/dom-ffi/lib/respo-dirty.mbt,20:::fn <a href="tiye/dom-ffi/lib#Window">Window</a>::dirty_remove_fn(self : <a href="tiye/dom-ffi/lib#Window">Window</a>, name : String) -> Unit
  ```
  > 
- #### dirty\_set\_fn
  ```moonbit
  :::source,tiye/dom-ffi/lib/respo-dirty.mbt,12:::fn <a href="tiye/dom-ffi/lib#Window">Window</a>::dirty_set_fn(self : <a href="tiye/dom-ffi/lib#Window">Window</a>, name : String, f : () -> Unit) -> Unit
  ```
  > 
- #### dirty\_set\_fn\_1
  ```moonbit
  :::source,tiye/dom-ffi/lib/respo-dirty.mbt,31:::fn <a href="tiye/dom-ffi/lib#Window">Window</a>::dirty_set_fn_1(self : <a href="tiye/dom-ffi/lib#Window">Window</a>, name : String, f : (String) -> Unit) -> Unit
  ```
  > 
- #### document
  ```moonbit
  :::source,tiye/dom-ffi/lib/document.mbt,3:::fn <a href="tiye/dom-ffi/lib#Window">Window</a>::document(self : <a href="tiye/dom-ffi/lib#Window">Window</a>) -> <a href="tiye/dom-ffi/lib#Document">Document</a>
  ```
  > 
- #### keyboard\_event\_init
  ```moonbit
  :::source,tiye/dom-ffi/lib/event.mbt,73:::fn <a href="tiye/dom-ffi/lib#Window">Window</a>::keyboard_event_init(self : <a href="tiye/dom-ffi/lib#Window">Window</a>, type_ : String) -> <a href="tiye/dom-ffi/lib#KeyboardEventInit">KeyboardEventInit</a>
  ```
  > 
- #### local\_storage
  ```moonbit
  :::source,tiye/dom-ffi/lib/storage.mbt,3:::fn <a href="tiye/dom-ffi/lib#Window">Window</a>::local_storage(self : <a href="tiye/dom-ffi/lib#Window">Window</a>) -> <a href="tiye/dom-ffi/lib#LocalStorage">LocalStorage</a>
  ```
  > 
- #### location
  ```moonbit
  :::source,tiye/dom-ffi/lib/location.mbt,4:::fn <a href="tiye/dom-ffi/lib#Window">Window</a>::location(self : <a href="tiye/dom-ffi/lib#Window">Window</a>) -> <a href="tiye/dom-ffi/lib#Location">Location</a>
  ```
  > 
- #### performance
  ```moonbit
  :::source,tiye/dom-ffi/lib/performance.mbt,4:::fn <a href="tiye/dom-ffi/lib#Window">Window</a>::performance(self : <a href="tiye/dom-ffi/lib#Window">Window</a>) -> <a href="tiye/dom-ffi/lib#Performance">Performance</a>
  ```
  > 
- #### remove\_event\_listener\_with\_callback
  ```moonbit
  :::source,tiye/dom-ffi/lib/window.mbt,16:::fn <a href="tiye/dom-ffi/lib#Window">Window</a>::remove_event_listener_with_callback(self : <a href="tiye/dom-ffi/lib#Window">Window</a>, type_ : String, f : () -> Bool) -> Unit
  ```
  > 
- #### request\_animation\_frame
  ```moonbit
  :::source,tiye/dom-ffi/lib/window.mbt,30:::fn <a href="tiye/dom-ffi/lib#Window">Window</a>::request_animation_frame(self : <a href="tiye/dom-ffi/lib#Window">Window</a>, f : (float) -> Unit) -> Unit
  ```
  > 
- #### set\_onbeforeunload
  ```moonbit
  :::source,tiye/dom-ffi/lib/window.mbt,41:::fn <a href="tiye/dom-ffi/lib#Window">Window</a>::set_onbeforeunload(self : <a href="tiye/dom-ffi/lib#Window">Window</a>, f : (<a href="tiye/dom-ffi/lib#BeforeUnloadEvent">BeforeUnloadEvent</a>) -> Unit) -> Unit
  ```
  > 
- #### set\_timeout
  ```moonbit
  :::source,tiye/dom-ffi/lib/window.mbt,23:::fn <a href="tiye/dom-ffi/lib#Window">Window</a>::set_timeout(self : <a href="tiye/dom-ffi/lib#Window">Window</a>, f : () -> Unit, ms : UInt) -> Unit
  ```
  > 

## before\_unload\_event

```moonbit
:::source,tiye/dom-ffi/lib/window.mbt,38:::fn before_unload_event() -> <a href="tiye/dom-ffi/lib#BeforeUnloadEvent">BeforeUnloadEvent</a>
```


## debugger

```moonbit
:::source,tiye/dom-ffi/lib/debug.mbt,1:::fn debugger() -> Unit
```


## error\_log

```moonbit
:::source,tiye/dom-ffi/lib/console.mbt,7:::fn error_log(msg : String) -> Unit
```


## load\_my\_window

```moonbit
:::source,tiye/dom-ffi/lib/respo-dirty.mbt,4:::fn load_my_window() -> <a href="tiye/dom-ffi/lib#Window">Window</a>
```
 this file contains dirty functions that Respo requires to call js

## log

```moonbit
:::source,tiye/dom-ffi/lib/console.mbt,1:::fn log(msg : String) -> Unit
```


## new\_url\_search\_params

```moonbit
:::source,tiye/dom-ffi/lib/params.mbt,4:::fn new_url_search_params(s : String) -> <a href="tiye/dom-ffi/lib#URLSearchParams">URLSearchParams</a>
```


## random\_id

```moonbit
:::source,tiye/dom-ffi/lib/respo-dirty.mbt,47:::fn random_id() -> String
```
 a temporary solution for generating random id

## warn\_log

```moonbit
:::source,tiye/dom-ffi/lib/console.mbt,4:::fn warn_log(msg : String) -> Unit
```


## window

```moonbit
:::source,tiye/dom-ffi/lib/window.mbt,4:::fn window() -> <a href="tiye/dom-ffi/lib#Window">Window</a>
```

