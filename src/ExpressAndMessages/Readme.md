# Expression et Messages

## Exercice: Objets Littéraux
 * 'helle, Dave' -> ByteString
 * 1.3 -> SmallFloat64
 * #node1 -> ByteSymbol
 * #(2 33 4) -> Array
 * [ :each | each scale: 1.5 ] -> BlockClosure
 * $A -> Character
 * true -> True
 * 1 -> SmallInteger

## Exercice : Messages
 * 3 + 4 --> Binaire |receveur : 3|selecteur : +|argument : 4|res = 7
 * Date today --> Unaire |receveur : Date|selecteur : Today|res = 8 January 2021
 * anArray at: 1 put: 'hello' --> Keyword|receveur : anArray|argument : 1,'hello'|res : met 'hello' à l'indice 1 dans l'array
 * anArray at: i --> Keyword|receveur : anArray|argument : 1|res : Objet à l’indice i dans l’array
 * #(2 33 -4 67) collect: [ :each | each abs ] --> Keyword |receveur : #(2 33 -4 67)|selecteur: collect:| argument: [ :each | each abs ] |res = #(2 33 4 67) 
 * 25 @ 50 --> Binaire |receveur : 25|selecteur : @|argument : 50|res = (25@50)
 * SmallInteger maxVal --> Unaire |receveur : SmallInteger|selecteur : maxVal|res : 1152921504606846975
 * #(a b c d e f) includesAll: #(f d b) --> Keyword|receveur  : #(a b c d e f)|selecteur: includesAll:| argument  : #(f d b)|res : true
 * true | false --> Binaire|receveur : true|selecteur : | | argument : false| res = true
 * Point selectors --> Unaire|receveur : Point|selecteur : selector| res = #(#reflectedAbout:,...,#to:sideOf:)
##Exercice : Nommage
 * Transferator est une variable globale --> variable globale|classe|variable de classe

 * rectangle est une variable locale -->  variable temporaire|variable d’instance|argument de méthode