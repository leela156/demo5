%dw 2.0
output application/json
var globalList = payload flatMap ((item) -> (
item.books map (b) -> {id: item.id,(b)}))
distinctBy ((item) -> item.bookid)
groupBy ((item) -> item.id)
---
keysOf(globalList) map ((item) ->
{
id: item,
books: globalList[item] map ((book) -> book - 'id')

} )

//To Filtering Unique Records we have created a globallist and for that I have used keysOOf and map function on sorted glaballist to filter the unique records