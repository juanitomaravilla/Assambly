# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jmartine <jmartine@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/10 16:17:03 by jmartine          #+#    #+#              #
#    Updated: 2020/03/10 16:17:03 by jmartine         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strcpy

_ft_strcpy:
	mov rcx, -1
while:
	inc		rcx
	mov		dl ,byte [rsi + rcx]			; dst = rdi, scr = rsi
	mov		byte [rdi + rcx], dl
	cmp		dl, 0
	jnz		while
	mov		rax, rdi						; return dst
	ret
