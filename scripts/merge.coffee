# Description:
#   Merge
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   listen for "merge me" --> provide awesome merge meme
#
# Author:
#   mr-joshua
merge_memes = [
  "https://lh3.googleusercontent.com/-pYbOtGPAoIY/Ulhz3vcmeGI/AAAAAAAAAF0/ui4V5-Fw5Yk/w510-h380-no/3r2pud.jpg",
  "https://lh4.googleusercontent.com/-J99wik5g7Lg/Ulhz4PP8w8I/AAAAAAAAAF8/6Oi-sldp9po/w296-h223-no/3skg98.jpg",
  "https://lh4.googleusercontent.com/-STAmBs61l6U/Ulhz4GgIhfI/AAAAAAAAAGc/5jlECLrvu2o/w310-h307-no/3u2pia.jpg",
  "https://lh6.googleusercontent.com/-67-JQ9D9P88/Ulhz2rdD7rI/AAAAAAAAAFM/Sc1RucNRICE/s400-no/36bf43.jpg",
  "https://lh3.googleusercontent.com/-GV9RZrJQQ8w/Ulhz2joCZPI/AAAAAAAAAFU/4sJlfdDRD0U/s400-no/31732657.jpg",
  "https://lh6.googleusercontent.com/-UWy7xwCpp0o/Ulhz2jBH6YI/AAAAAAAAAFc/M8SHkDitGOg/s400-no/35086925.jpg",
  "https://lh4.googleusercontent.com/-f5tVXZrKVl4/Ulhz3Pv5YmI/AAAAAAAAAFk/6KR7Nv1AZF8/w400-h300-no/37065582.jpg",
  "https://lh4.googleusercontent.com/-h-UZP5_ZMd8/Ulhz3u_Pm-I/AAAAAAAAAFs/wU6ZMLk3AK0/s400-no/37572377.jpg",
  "https://lh3.googleusercontent.com/-rf8C619MyMI/Ulhz5d6LiyI/AAAAAAAAAGQ/MrLLDMvPOig/w240-h360-no/687474703a2f2f692e696d6775722e636f6d2f716f65356f2e6a7067.jpeg",
  "https://lh6.googleusercontent.com/-AEYyA2OUzLQ/Ulhz4mRMHHI/AAAAAAAAAGA/J7Djc_BF64A/s360-no/687474703a2f2f692e696d6775722e636f6d2f47554939382e6a7067.jpeg",
  "https://lh4.googleusercontent.com/-V3vjhBYZJQ8/Ulhz40s-wsI/AAAAAAAAAGM/y-N1_Q8RwbI/w268-h360-no/687474703a2f2f692e696d6775722e636f6d2f53455169542e6a7067.jpeg",
  "https://lh4.googleusercontent.com/-s28uWc5IuK8/Ulhz6xf7WWI/AAAAAAAAAG8/QYNYrUL5kyU/w596-h671-no/addon.jpeg",
  "https://lh5.googleusercontent.com/-oIkgjyjVJZU/Ulhz58nhIEI/AAAAAAAAAG0/g2ocMdD20qU/w900-h619-no/Batman-And-Iron-Man-Combine.png",
  "https://lh5.googleusercontent.com/-jjyCCRE6gnM/Ulhz7u1au2I/AAAAAAAAAHU/-IPaVMBdOl8/s512-no/bear_shark_poster-r6697997ffcd549b0a68b3c404298e7e8_fur30_8byvr_512.jpg",
  "https://lh6.googleusercontent.com/-AHRaJJDNrXA/Ulhz7mGxqiI/AAAAAAAAAHM/akb5zKZLMWI/w480-h360-no/funny-chocolate-bars-Cadbury-Nestle-merge.jpg",
  "https://lh6.googleusercontent.com/-dx9PZLsLiNA/Ulhz8BRUUFI/AAAAAAAAAH0/vh7Bb6dLfK0/w194-h260-no/images.jpeg",
  "https://lh4.googleusercontent.com/-vLOzpYokHTc/Ulhz8F5T-MI/AAAAAAAAAHc/mL3qq4FAnbA/w500-h372-no/merge.jpg",
  "https://lh3.googleusercontent.com/-KMf134hRe8A/Ulhz5xQLJcI/AAAAAAAAAGk/2Ma4ceP2EfY/w700-h550-no/Merge_o_8565.jpg",
  "https://lh6.googleusercontent.com/-3fRpHRsma44/Ulhz8RG3esI/AAAAAAAAAHk/7ua0z8lYz7A/s250-no/nEfIm.jpg",
  "https://lh3.googleusercontent.com/-XHPeiGYgYfs/Ulhz6iGQ86I/AAAAAAAAAGw/HJvIyvrYZEI/w255-h403-no/Nice-Merge-951.jpg",
  "https://lh4.googleusercontent.com/-l3Bj3iP3H_I/Ulhz8wuvk3I/AAAAAAAAAHs/GUhI9zY4Xs0/w479-h510-no/no-coffee-meme-generator-what-do-you-mean-there-s-no-coffee-3b1962.jpg",
  "https://lh4.googleusercontent.com/-U3zEItFgFRA/Ulhz9szN4WI/AAAAAAAAAH8/ON_BwqKjvds/w552-h656-no/no-merge-conflicts-yes.jpg",
  "https://lh4.googleusercontent.com/-qQTp2n3ntCg/Ulhz9ibr0qI/AAAAAAAAAIA/RT6G-J2m838/w388-h510-no/rasta-science-teacher-meme-generator-merge-hotfix-smoke-hotfix-06cd49.jpg",
  "https://lh6.googleusercontent.com/-z1GhMaIesng/Ulhz6kvjnoI/AAAAAAAAAHE/HZi3Y9akMeY/w600-h399-no/Zebra-merge.jpg"
]

module.exports = (robot) ->
  robot.hear /merge me/i, (msg) ->
    msg.send msg.random merge_memes