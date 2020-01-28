#Today is the last day of 'basics'
#UNIX/bash scripting, and regular expression
#everything after today is just learning to apply 
#the tools we already covered in the first four weeks to specific problems

#guest lec: Hartmutt Spider, high performance computing lecture (aka the CAC)


###regular expression. A powerful set of programming tools, not oft used in bio
#control-F, then can use find/replace manually
#reg expression just automate this process

#Regular Expressions, Regex or Regexp
grep()
grepl()
sub()
gsub()
#also some more advanced expressions, see linked tutorial if you are interested

Species <- c("petiolata","verticillatus","salicaria","minor")
grep("a", Species) #returns the indices of the cells that match the request

#this is how we return the VALUES of the cells that match the request
Species[grep("a", Species)]

grepl("a", Species) #this returns TRUE/FALSE vector, instead of number index vector
Species[grepl("a", Species)] 

#so basically, grep and grepl are like the 'find' function
#sub and gsub are the 'find and replace' function

sub("l", "L", Species) #only replaces the FIRST matching patterns found within a cell
gsub("l", "L", Species) #replaces ALL matching patterns found within a cell

#the power of the regex comes in the form of "wildcards"
#the 'backslash' is an escape character

gsub("w", "+", "...which 1-100 words get replaced?")
gsub("\\w", "+", "...which 1-100 words get replaced?") 

#("\\w" is a wildcard, the \\ means 'escape the w meaning' and instead 
#use the w as a representation of any alphanumeric character

gsub("\\W", "+", "...which 1-100 words get replaced?") 



-"\\w" any alphanumeric character
-"\\W" any NON alphanumeric character
-"\\s" replace spaces
-"\\S" replace NON spaces
-"\\d" replace digits
-"\\D" replace NON digits

#he says these are worth trying to memorize

#if working with genbank data, the files often have multiple lines.. 
#each indiv may have a long string that makes up LOTS of diff observations

-"\\n" identify a new line
-"\\r" carriage return character (aka return with a tab) 
#what does it actually do? Can we see an example?

- "|" this is the OR
- "." ANY character except a new line character
gsub("w|e", "+", "...which 1-100 words get replaced?") 
gsub(".", "+", "...which 1-100 words get replaced?") 
#if you want to escape the wildcard ., and legit search for period, use //.

#the + means 1 or more
sub("0+","+", "...which 1-100 words get replaced?") #find any string with a "zero" 1 or more times, then replace with a "+".

sub("\\w+","+", "...which 1-100 words get replaced?") 
#find any alphanumeric character that occurs 1 or more times, then replace that consecutive string of alphanumeric characters with a "+"

#replace any word that's a string of 3 or 4 letters/digits in a row
gsub("\\w{3,4}","+","...which 1-100 words get replaced?")

#replace any word that's a string of EXACTLY 3 
gsub("\\w{3}","+","...which 1-100 words get replaced?")

#replace any word that's a string of 3 or MORE in a row
gsub("\\w{3,}","+","...which 1-100 words get replaced?")

#Instead of putting | a bunch of times, we can just put everything in square brackets
gsub("a|c|e|i|h","+","...which 1-100 words get replaced?")
gsub("[aceih]","+","...which 1-100 words get replaced?") #SIMPLIER WAY TO LOOK FOR INDIV LETTERS

gsub("[a-z]","+","...which 1-100 words get replaced?") #ONLY LETTERS
gsub("[a-z//-]","+","...which 1-100 words get replaced?") #LETTERS AND DASHES


grep("^s", Species) #start with s
grep("a$", Species) #end with a

#^ inside of [ ] means negate

grep("[^s]", Species) #find every letter other than s; all Species have at least 1 letter that's not s
gsub("[^s]", "+", Species) #way to check exactly what its finding!

# use brackets to keep and rearrange text
#let's say the goal is switch the first and last letter of each word

gsub("(\\w)(\\w+)(\\w)", "\\3\\2\\1", "...which 1-100 words get replaced?")
#can denote what things I'm moving by the order of the brackets, 1,2,3

#could write a regular expression to identify whether a string is an email address or not
#this is a good practice
rob.colautti@queensu.ca
rob.colautti[at]queensu[dot]ca
rob.colautti 'at' queensu 'dot' ca

#then write one that will convert the common "dodges" to a standard email address

grepl("'at'|'dot'", "I was there at the dot-com bubble")
grepl("'at'|'dot'", "rob.colautti 'at' queensu 'dot' ca")
grepl("[at]|[dot]", "I was there at the dot-com bubble") #bad, the [] have a different meaning
grepl("\\[at\\]|\\[dot\\]", "I was there at the dot-com bubble") #escapes the other meaning of []


##and thus concludes the final class of basics!
