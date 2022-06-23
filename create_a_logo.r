install.packages("hexSticker")

library(hexSticker)


imgurl <- system.file("https://images.squarespace-cdn.com/content/v1/58d8d0ffe4fcb5ad94cde63e/1491918370554-X7CYU9OUEKVA7XBK6J6T/NHS+England+Regions?format=500w", package="hexSticker")

sticker(imgurl, package="NHS England R Users", p_size=10, p_color = "#425563", s_x=1, s_y=1, s_width=1, s_height=01,  h_fill="#0072CE", h_color="#003087",
        filename="NHShex.png")

