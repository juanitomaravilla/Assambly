# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: juancarlosmartineznavas <juancarlosmart    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/13 15:24:31 by juancarlosm       #+#    #+#              #
#    Updated: 2020/03/13 15:48:12 by juancarlosm      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			section	.text
			global	_ft_strcmp


_ft_strcmp:									; s1 = rdi, s2 = rsi
			xor		rdx, rdx				; xor para declarar un contador
			xor		rcx, rcx
			cmp		rdi, 0					; s1 igual a 0
			jz		check					; si es 0, salta check
			cmp		rsi, 0					; igual para s2
			jz		check					; igual para s2

check:
			cmp		rdi, rsi				; compara s1 y s2
			je		ret0					; si son iguales, salta a ret0
			jg		ret1					; si s1 es mayor a s2, salta a ret1
			jmp		ret2					; si no a ret2

cmp:
			mov		dl, BYTE [rsi + rdx]	; mete el s2i byte a byte en el puntero dl
			cmp		BYTE [rdi + rdx], dl	; compara el puntero dl byte a byte con s1i
			je		ret0
			jg		ret1
			jmp		ret2

ret0:
			mov		rax, 0						; retorna 0 si es igual
			ret
ret1:
			mov		rax, 1						; retorna si s1 es mayor
			ret
ret2:
			mov		rax, -1						; retorna s2 mayor
			ret
