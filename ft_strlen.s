# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juancarlosmartineznavas <juancarlosmart    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/12 13:54:34 by juancarlosm       #+#    #+#              #
#    Updated: 2020/03/12 14:33:32 by juancarlosm      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

		global		_ft_strlen

		section		.text

_ft_strlen:
					xor			rax, rax
					jmp			char
sum:
					inc			rax
char:
					cmp			BYTE [rdi + rax], 0
					jne			sum
return:
					ret
