-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 24 Maj 2019, 22:32
-- Wersja serwera: 10.1.38-MariaDB
-- Wersja PHP: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `employee_manager`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `loginy`
--

CREATE TABLE `loginy` (
  `id_u` int(11) NOT NULL,
  `login` varchar(30) NOT NULL,
  `haslo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `loginy`
--

INSERT INTO `loginy` (`id_u`, `login`, `haslo`) VALUES
(1, 'MarcinK', 'Marcinek'),
(2, 'MarekP', 'MareczekP');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typy_konta`
--

CREATE TABLE `typy_konta` (
  `id_t` int(11) NOT NULL,
  `nazwa` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `typy_konta`
--

INSERT INTO `typy_konta` (`id_t`, `nazwa`) VALUES
(1, 'Użytkownik'),
(2, 'Administrator');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typy_umowy`
--

CREATE TABLE `typy_umowy` (
  `id_t` int(11) NOT NULL,
  `nazwa_skr` varchar(5) NOT NULL,
  `nazwa` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `typy_umowy`
--

INSERT INTO `typy_umowy` (`id_t`, `nazwa_skr`, `nazwa`) VALUES
(1, 'UoP', 'Umowa o prace'),
(2, 'B2B', 'Własna działalność'),
(3, 'UZ', 'Umowa zlecenia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownicy`
--

CREATE TABLE `uzytkownicy` (
  `id_u` int(11) NOT NULL,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  `nr_konta` varchar(16) NOT NULL,
  `wyplata_netto` double NOT NULL,
  `stanowisko` varchar(50) NOT NULL,
  `id_tu` int(11) NOT NULL,
  `id_tk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `uzytkownicy`
--

INSERT INTO `uzytkownicy` (`id_u`, `imie`, `nazwisko`, `mail`, `nr_konta`, `wyplata_netto`, `stanowisko`, `id_tu`, `id_tk`) VALUES
(1, 'Marcin', 'Kos', 'abcd@gmail.com', '1111222233334444', 10000, 'Programista', 2, 2),
(2, 'Marek', 'Pałdyna', 'marek@marek.pl', '5555444433331111', 9000, 'Programista', 3, 2);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `loginy`
--
ALTER TABLE `loginy`
  ADD PRIMARY KEY (`id_u`);

--
-- Indeksy dla tabeli `typy_konta`
--
ALTER TABLE `typy_konta`
  ADD PRIMARY KEY (`id_t`);

--
-- Indeksy dla tabeli `typy_umowy`
--
ALTER TABLE `typy_umowy`
  ADD PRIMARY KEY (`id_t`);

--
-- Indeksy dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD PRIMARY KEY (`id_u`),
  ADD KEY `fk_uzytkownicy_typy_umowy` (`id_tu`),
  ADD KEY `fk_uzytkownicy_typy_konta1` (`id_tk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `typy_konta`
--
ALTER TABLE `typy_konta`
  MODIFY `id_t` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `typy_umowy`
--
ALTER TABLE `typy_umowy`
  MODIFY `id_t` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  MODIFY `id_u` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `loginy`
--
ALTER TABLE `loginy`
  ADD CONSTRAINT `loginy_ibfk_1` FOREIGN KEY (`id_u`) REFERENCES `uzytkownicy` (`id_u`);

--
-- Ograniczenia dla tabeli `uzytkownicy`
--
ALTER TABLE `uzytkownicy`
  ADD CONSTRAINT `fk_uzytkownicy_typy_konta1` FOREIGN KEY (`id_tk`) REFERENCES `typy_konta` (`id_t`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_uzytkownicy_typy_umowy` FOREIGN KEY (`id_tu`) REFERENCES `typy_umowy` (`id_t`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
