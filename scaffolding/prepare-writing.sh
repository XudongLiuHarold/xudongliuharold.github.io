echo "👨‍💻 start writing, input title:"
read TITLE
echo "✍️ subtitle: (could be empty)"
read SUBTITLE
echo "📂 generating blog ...." 
DATE=$(date +'%Y-%m-%d')
FILE_NAME="${DATE}-${TITLE}.md"
FREE_LINE="---\n"
LAYOUT_LINE="layout:     post\n"
TITLE_LINE="title:      ${TITLE} \n"
SUBTITLE_LINE="subtitle:   ${SUBTITLE}\n"
DATE_LINE="date:       ${DATE}\n"
AUTHOR_LINE="author:     Xudong\n"
HEADER_LINE="header-img: img/background.jpg\n"
TAG_LINE="tags:		\n"
CONFIG="${FREE_LINE}${LAYOUT_LINE}${TITLE_LINE}${SUBTITLE_LINE}${DATE_LINE}${AUTHOR_LINE}${HEADER_LINE}${TAG_LINE}${FREE_LINE}"
rm ./_posts/${FILE_NAME}
echo ${CONFIG} > ./_posts/${FILE_NAME}
echo "🎉 generated, enjoy!"

open -a "Mark Text" ./_posts/${FILE_NAME}
