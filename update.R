if(!require(dplyr)) {
  install.packages("dplyr")
  require(dplyr)
}
if(!require(xml2)) {
  install.packages("xml2")
  require(xml2)
}
if(!require(rvest)) {
  install.packages("rvest")
  require(rvest)
}
if(!require(stringr)) {
  install.packages("stringr")
  require(stringr)
}
if(!require(httr)) {
  install.packages("httr")
  require(httr)
}
if(!require(lubridate)) {
  install.packages("lubridate")
  require(lubridate)
}


url = 'https://packages.ubuntu.com/hirsute/r-base'
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

user = 'dr2pedro'
repo = 'baseR-multiarch-Docker-image'
token = Sys.getenv("GITHUB_TOKEN")


set_artifactid_env <- function(user, repo, token) {

  link = paste0('https://api.github.com/repos/', user, '/', repo, '/', 'actions/artifacts')
    
  content <- 
    GET(link,
        add_headers(Authorization= paste(user,token))
    )  
  
  dates = NULL
  id = NULL
  
  for (i in 1:length(content(content)$artifacts)) {
    
    dates[i] <- content(content)$artifacts[[i]]$created_at
    id[i] <- content(content)$artifacts[[i]]$id
    print(paste(as_date(dates), id))
    
  }
  
  dataset <- data.frame(cbind(id,dates))
  
  
  dataset[order(dataset$dates, decreasing = TRUE),]
  
  return(dataset)
  
}

dataset<- set_artifactid_env(user, repo, token)

write.table(as.numeric(dataset$id[1]), 'ARTIFACT_ID.txt', row.names = FALSE, col.names = FALSE)
