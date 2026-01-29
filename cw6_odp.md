6. Jaki typ SCD został zaimplementowany w każdej z kwerend w zadaniu numer 5b i 5c?

5b.1 – SCD Type 1 – Changing attribute (nadpisanie wartości, brak przechowywania poprzedniej, liczba rekordów w tabeli bez zmian)

5b.2 – SCD Type 2 – Historical attribute (nowa wartość kolumny Title, informacja o update przechowywana w StartDate, poprzedni rekord ze starą wartością przechowuje informację o jego zmianie w EndDate, tutaj zwiększamy liczbę rekordów w tabeli outputowej)

5c – SCD Type 0 – Fixed attribute (atrybut stały – zmiana jest niedozwolona, jej próba kończy się błędem SSIS).

## 7. Jakie ustawienie i dlaczego miało wpływ na działanie procesu w przypadku kwerendy 5c? 

Po zmianie wartości kolumny fixed następuje zatrzymanie SSIS i dostajemy komunikat z błędem

