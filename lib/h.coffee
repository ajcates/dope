
#class B {
	#//get ya blocks!
	
	#public static function get($reallyHopeNoOneNamesThereVaribleThis, $values=array()) {
		#extract((array) $values);
		#ob_start();
		#include(LOC . '/sweet-framework/blocks/' . $reallyHopeNoOneNamesThereVaribleThis . '.php' );
		#/*
		#f_first
		#if(is_array($values[0])) {
			#$attributes 
		#}
		#'<' . $tagName . '>'
		#*/
		#return ob_get_clean();
	#}
	
	#public static function __callStatic($tagName, $values=array()) {
		
		#if(isset($values[0]) && is_array($values[0])) {
			#//D::log($values[0], '0 values');
			#$attributes = ' ' . join(' ', f_keyMap(
				#function($v, $k) {
					#if(!empty($v)) {
						#return $k . '="' . join(', ', (array)$v)  . '"';
					#}
				#},
				#$values[0]
			#));
			#$childern = f_rest($values);
		#} else {
			#$attributes = '';
			#$childern =& $values;
		#}
		#if(empty($childern) && $tagName != 'script') {
			#return '<' . $tagName . $attributes . '/>';
		#} else {
			#return '<' . $tagName . $attributes . '>' . join((array)$childern) . '</' . $tagName . '>';
		#}
	#}
#}
#


l = console.log

module.exports = (tag, props, args...) ->
    attr = ""
    if typeof props is "object" 
        attr = (for own key, val of props
            if val? then " #{key}=\"#{val}\"" else ""
        ).join("")
    else
        args.unshift props

    if args.length > 0 then "<#{tag}#{attr}>#{args.join("")}</#{tag}>" else "<#{tag}#{attr}/>"
    
