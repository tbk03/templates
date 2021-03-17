# ----------------------------------------------------------------------
# IMPORT LIBRARIES
#-----------------------------------------------------------------------
library(tidyverse)

# plotting libraries
library(patchwork) # for combining plot comments
library(ggtext) # for basic html formatting in plot
library(glue) # for string processing
library(showtext) # for fonts and text formatting
library(viridisLite) # colour blind friendly pallette

# ----------------------------------------------------------------------
# SETUP FOR PLOTTING
#-----------------------------------------------------------------------
# set default theme
theme_set(theme_light())

# import fonts
font_add_google("Roboto", "robo")
font_add_google("Roboto Slab", "robo-slab")

## Automatically use showtext to render text
showtext_auto()


# ----------------------------------------------------------------------
# WRANGLE DATA
#-----------------------------------------------------------------------
# create dummy data
df <- tibble(x = c(0, 1, 2, 3),
             y = c(0, 1, 2, 3))


# ----------------------------------------------------------------------
# SPECIFY PLOT COLOURS
# ----------------------------------------------------------------------

# get n colours from the discrete viridis colour pallette
pal <- viridis(n = 3, alpha = 1, begin = 0, end = 1, direction = 1,option ="A")

# specify colour options
bg_colours <- c("#dee3e3") # a list of possible background colors
text_colours <- c("#") # a list of possible text colors

#define colours used in the plot
bg_colour <- bg_colours[1]


# ----------------------------------------------------------------------
# ADD PLOT TEXT
# ----------------------------------------------------------------------
# plain text
plot_title <- str_to_upper("holding title")
x_axis_title <-  "x axis title"
y_axis_title <-  "y axis title"

# html / markdown formatted text
plot_subtitle <- '<b style="color:#000004FF">Key point 1</b>
                      \n<b style="color:#B63679FF">Key point 2</b>
                      \n<b style="color:#FCFDBFFF">Key point 3</b>'
plot_caption <- '<b>source:</b> ...  | <b>viz:</b> @chrismartin81
<br><b>note:</b> ...'


# ----------------------------------------------------------------------
# CREATE PLOT
# ----------------------------------------------------------------------

# create plot
ggplot(df, aes(x, y)) +
  
  # plot type
  geom_point() +
  
  # plot text labels
  labs(x = x_axis_title,
       y = y_axis_title,
       title = plot_title,
       subtitle = plot_subtitle,
       caption = plot_caption
  ) +
  
  # add text formatting
  theme(
    
    # set fonts
    title = element_text(family = "robo"),
    text = element_text(family = "robo"),
    
    # enable use of markdown and html in specified text
    plot.subtitle = ggtext::element_markdown(family = "robo-slab", size = 40),
    plot.caption = ggtext::element_markdown(family = "robo-slab", size = 30),
    
    # set background colour scheme
    panel.background = element_rect(fill = bg_colour), # set colour inside the axis
    plot.background = element_rect(fill = bg_colour), # set colour outside the axis
    
    # remove grid lines
    panel.grid = element_blank(),
    
    # set text size for output
    plot.title = element_text(size = 80),
    axis.text = element_text(size = 35, face = "bold"),
    axis.title = element_text(size = 40) 
  )

ggsave("template_test.png", width = 10, height = 5, units = "in")

# plot_annotation(title = "HOLDING TITLE",
#                 subtitle = glue('<b style="color:#00aa00">coloured text</b>',
#                                 'plain text'),
#                 theme = theme(plot.subtitle = ggtext::element_markdown(family = "robo-slab"))
# ) +
