if(!require(dplyr)) {
  install.packages("dplyr")
}
if(!require(xml2)) {
  install.packages("xml2")
}
if(!require(rvest)) {
  install.packages("rvest")
}
if(!require(stringr)) {
  install.packages("stringr")
}

url = 'https://packages.ubuntu.com/groovy/r-base'
node = 'h1'


get_html_text <- function(url, node){
  content = read_html(url)%>%
    html_nodes(node)%>%
    html_text()%>%
    trimws()
  
  return(content)
}


content = get_html_text(url, node)


filter_versions_numbers <- function(content){
  content_of_version=NULL
  for (i in 1:length(content)) {
    content_of_version[[i]]=str_match_all(content[i], "[[:digit:]]+\\.*[[:digit:]]*+\\.*[[:digit:]]*") %>% 
      unlist
  }
  return(content_of_version)
}

version = filter_versions_numbers(content)[[1]][1]

write.table(version, 'R-version-available.txt', sep = '', row.names = FALSE, col.names = FALSE)
