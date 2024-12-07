# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lamachad <lamachad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/11/25 18:22:33 by lamachad          #+#    #+#              #
#    Updated: 2024/12/05 19:36:22 by lamachad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Nome do programa
NAME = pipex

# Diretórios
SRC_DIR = src
LIBFT_DIR = ../libft

# Arquivos fontes e objetos
SRC = $(SRC_DIR)/pipex.c \
      $(SRC_DIR)/utils.c
OBJ = $(SRC:.c=.o)

# Biblioteca libft
LIBFT = $(LIBFT_DIR)/libft.a
LIBFT_INC = -I$(LIBFT_DIR)

# Compilador e flags
CC = cc
C_FLAGS = -Wall -Wextra -Werror -g

# Regra padrão
all: $(LIBFT) $(NAME)

# Compilação do programa
$(NAME): $(OBJ)
	$(CC) $(C_FLAGS) $(OBJ) $(LIBFT) -o $(NAME)

# Compilação dos objetos
%.o: %.c
	$(CC) $(C_FLAGS) $(LIBFT_INC) -c $< -o $@

# Compilação da libft
$(LIBFT):
	make -C $(LIBFT_DIR)

# Limpeza de objetos e biblioteca
clean:
	rm -f $(OBJ)
	make clean -C $(LIBFT_DIR)

fclean: clean
	rm -f $(NAME)
	make fclean -C $(LIBFT_DIR)

# Recompilação completa
re: fclean all

.PHONY: all clean fclean re



# NAME = pipex

# SRC = src/pipex.c
# 			src/utils.c
# 			libft/libft.a

# OBJ = $(SRC:.c=.o)

# CC = cc

# C_FLAGS = -Wall -Wextra -Werror

# all: $(NAME)

# $(NAME): $(OBJ)

# %.o: %.c pipex
# 	$(CC) $(C_FLAGS) -c $< -o $@
# 	ar rcs $(NAME) $@

# clean:
# 	rm -f $(OBJ)

# fclean: clean
# 	rm -f $(NAME)

# re: fclean all

# .PHONY: all clean fclean re
