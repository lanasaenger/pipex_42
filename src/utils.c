/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   utils.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lamachad <lamachad@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/11/25 18:38:57 by lamachad          #+#    #+#             */
/*   Updated: 2024/12/06 20:50:52 by lamachad         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

# include "pipex.h"

void	exit_pipe(int n_exit) //recebe um inteiro para decidir o que fazer;
{
	if (n_exit == 1)                                          //verifica se o n_exit é igual a 0, se for vai retornar o erro;
		ft_putstr_fd("./pipex infile cmd cmd outfile\n", 2); //usamos a função para printar o erro na saída padrão; 
	exit(0);                                           // se der erro finaliza a função e retorna 0;
}

int	open_file(char *file, int out_exit)
{
	int	ret;

	if (out_exit == 0)
		ret = open(file, O_RDONLY, 0644);
	if (out_exit == 2)
		ret = open(file, O_WRONLY | O_CREAT | O_TRUNC, 0644);
	if (ret == -1) 
	{
    	perror("Erro ao abrir o arquivo");
    	return (-1);
	}
	return (ret);
}

void	free_tab(char **tab)
{
	size_t	i;
	
	i = 0;
	while (tab[i])
	{ex
		free(tab[i]);
		i++;
	}
	free(tab);
}


// int main()
// {
//     int fd_in = open_file("entrada.txt", 0); // Abre para leitura
//     int fd_out = open_file("saida.txt", 1);  // Abre para escrita

//     // Trabalhar com os descritores...
//     close(fd_in);
//     close(fd_out);
//     return 0;
// }

