# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adesmet <adesmet@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/02 19:04:53 by adesmet           #+#    #+#              #
#    Updated: 2021/02/08 15:42:24 by adesmet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC = 	ft_strlen.c ft_strlcat.c ft_memset.c ft_calloc.c \
		ft_bzero.c ft_memcpy.c ft_memccpy.c ft_memmove.c \
		ft_memchr.c ft_memcmp.c ft_isalpha.c ft_isdigit.c \
		ft_isascii.c ft_atoi.c ft_isprint.c ft_tolower.c \
		ft_toupper.c ft_strchr.c ft_strrchr.c ft_strncmp.c \
		ft_strlcpy.c ft_strdup.c ft_isalnum.c ft_strnstr.c \
		ft_substr.c ft_split.c ft_putchar_fd.c ft_putnbr_fd.c \
		ft_putendl_fd.c ft_putstr_fd.c ft_strjoin.c ft_strtrim.c \
		ft_itoa.c ft_strmapi.c

SRCS_BONUS	=	ft_lstadd_back.c\
				ft_lstclear.c\
				ft_lstiter.c\
				ft_lstmap.c\
				ft_lstsize.c\
				ft_lstadd_front.c\
				ft_lstdelone.c\
				ft_lstlast.c\
				ft_lstnew.c\
				
OBJS = ${SRC:.c=.o}
OBJS_BONUS	=	$(SRCS_BONUS:.c=.o)
NAME = libft.a

all: ${NAME}

${NAME}: ${OBJS}
	ar -rcs ${NAME} ${OBJS}

bonus:	$(OBJS_BONUS)
	ar -rcs $(NAME) $(OBJS_BONUS)
	
${OBJS} :
	gcc -Wall -Werror -Wextra -c -I./includes ${@:.o=.c} -o $@

${OBJS_BONUS} :
	gcc -Wall -Werror -Wextra -c -I./includes ${@:.o=.c} -o $@
	
full:		$(NAME) bonus

all:		$(NAME)

clean:
	rm -f ${OBJS} $(OBJS_BONUS)

fclean: clean
	rm -f ${NAME} $(OBJS_BONUS)

re: fclean all

so:
	gcc -c -Wall -Werror -Wextra -fPIC ${SRC} ${SRCS_BONUS}
	gcc -shared -o libft.so ${OBJS} ${OBJS_BONUS}
		
.PHONY : all clean fclean re bonus full
