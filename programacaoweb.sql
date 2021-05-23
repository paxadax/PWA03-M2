-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23-Maio-2021 às 20:50
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `programacaoweb`
--
CREATE DATABASE IF NOT EXISTS `programacaoweb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `programacaoweb`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `tipo` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `tipo`) VALUES
(1, 'Teclados'),
(2, 'Ratos'),
(3, 'Monitores'),
(4, 'Headsets'),
(5, 'Portáteis'),
(6, 'Desktops'),
(7, 'Webcam'),
(8, 'Volantes e Pedais'),
(9, 'Colunas'),
(10, 'Componentes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoriaproduto`
--

DROP TABLE IF EXISTS `categoriaproduto`;
CREATE TABLE `categoriaproduto` (
  `id` int(11) NOT NULL,
  `categoriaId` int(11) DEFAULT NULL,
  `produtoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `dataNasc` varchar(512) NOT NULL,
  `nif` int(11) NOT NULL,
  `morada` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `dataNasc`, `nif`, `morada`) VALUES
(1, 'Miguel', '28/12/2000', 123456789, 'Rua em Famalicao'),
(2, 'Francisco', '13/11/2001', 123456780, 'Rua em Gaia'),
(3, 'Pedro', '24/07/2000', 123456781, 'Rua na Maia'),
(4, 'João', '05/05/1996', 123456782, 'Rua na Maia'),
(5, 'Mascarenhas', '21/05/1999', 123456783, 'Rua em Guimaraes'),
(6, 'Guilherme', '10/10/1999', 123456784, 'Rua no Porto'),
(7, 'Ricardo', '08/08/1999', 123456785, 'Rua no Porto'),
(8, 'Hugo', '03/03/2000', 123456786, 'Rua na Póvoa'),
(9, 'Rui', '09/09/1998', 123456787, 'Rua em Lisboa'),
(10, 'Marco', '29/05/2001', 123456788, 'Rua em Famalicao'),
(11, 'João', '27/02/2001', 123456700, 'Rua em Famalicao'),
(12, 'Miguel', '21/12/2001', 123456701, 'Rua em Famalicao'),
(13, 'Simão', '25/10/2001', 123456702, 'Rua em Braga'),
(14, 'Vasco', '30/03/2001', 123456703, 'Rua em Famalicao'),
(15, 'José', '14/05/2001', 123456704, 'Rua em Cruz'),
(16, 'Paulo', '04/04/1999', 123456705, 'Rua em Seide'),
(17, 'Bruno', '14/02/2001', 123456706, 'Rua em Cruz'),
(18, 'Luis', '20/03/2002', 123456707, 'Rua em Cruz'),
(19, 'Joao', '20/03/2002', 123456708, 'Rua em Famalicao'),
(20, 'Alexandre', '04/12/2001', 123456711, 'Rua no Louro'),
(21, 'José', '31/12/2001', 123456712, 'Rua em Braga'),
(22, 'Ruben', '05/03/2001', 123456713, 'Rua em Esmeriz'),
(23, 'Rui', '11/08/2001', 123456714, 'Rua em Famalicao'),
(24, 'João', '15/04/2001', 123456715, 'Rua em Famalicao'),
(25, 'Rui', '28/08/2000', 123456716, 'Rua em Cruz'),
(26, 'Vasco', '05/04/2001', 123456717, 'Rua em Barcelos'),
(27, 'Francisco', '23/01/2003', 123456718, 'Rua no Porto'),
(28, 'Mario', '17/02/2002', 123456719, 'Rua no Porto'),
(29, 'Manuel', '20/02/2001', 123456720, 'Rua em Famalicao'),
(30, 'Joao', '25/12/1998', 123456721, 'Rua em Famalicao');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clienteencomenda`
--

DROP TABLE IF EXISTS `clienteencomenda`;
CREATE TABLE `clienteencomenda` (
  `id` int(11) NOT NULL,
  `clienteId` int(11) DEFAULT NULL,
  `encomendaId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `encomenda`
--

DROP TABLE IF EXISTS `encomenda`;
CREATE TABLE `encomenda` (
  `id` int(11) NOT NULL,
  `clienteId` int(11) NOT NULL,
  `produtoId` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `encomenda`
--

INSERT INTO `encomenda` (`id`, `clienteId`, `produtoId`, `quantidade`, `total`) VALUES
(1, 1, 1, 1, 129),
(2, 1, 2, 2, 158),
(3, 1, 1, 1, 129),
(4, 2, 3, 2, 178),
(5, 3, 4, 1, 29),
(6, 3, 2, 1, 79),
(7, 4, 5, 1, 59),
(8, 5, 5, 2, 118),
(9, 10, 6, 5, 545),
(10, 10, 7, 1, 219),
(11, 11, 7, 1, 219),
(12, 12, 8, 1, 315),
(13, 13, 1, 1, 129),
(14, 14, 9, 1, 274),
(15, 15, 10, 1, 110),
(16, 16, 11, 1, 110),
(17, 17, 1, 1, 129),
(18, 18, 2, 1, 79),
(19, 19, 1, 1, 129),
(20, 20, 12, 1, 59),
(21, 21, 13, 1, 1400),
(22, 22, 14, 1, 1300),
(23, 23, 15, 2, 1200),
(24, 24, 16, 2, 798),
(25, 25, 17, 1, 899),
(26, 26, 18, 1, 1899),
(27, 27, 1, 1, 129),
(28, 28, 19, 1, 49),
(29, 29, 20, 1, 199),
(30, 30, 21, 1, 59);

-- --------------------------------------------------------

--
-- Estrutura da tabela `encomendaproduto`
--

DROP TABLE IF EXISTS `encomendaproduto`;
CREATE TABLE `encomendaproduto` (
  `id` int(11) NOT NULL,
  `encomendaId` int(11) DEFAULT NULL,
  `produtoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `nome` varchar(512) NOT NULL,
  `categoriaId` int(11) NOT NULL,
  `preco` int(11) NOT NULL,
  `descricao` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `nome`, `categoriaId`, `preco`, `descricao`) VALUES
(1, 'Razer Blackwidow', 1, 129, 'Desde a sua concepção, o nome Razer BlackWidow é sinónimo não apenas de precisão, mas também da sensação tátil e sonora dos seus switches tão amados pelos gamers. A Razer ajustou os seus switches mecânicos para libertar o mais alto nível de desempenho de jogo com a mais recente edição do Switch Mecânico Verde Razer™. Jogue com satisfação sonora total e iluminação Razer Chroma™ no novo Razer BlackWidow.'),
(2, 'Corsair K55 RGB ', 1, 79, 'O teclado para jogos Corsair K55 RGB Pro ilumina a sua área de trabalho com retroiluminação RGB dinâmica de cinco zonas e aumenta a sua jogabilidade com seis teclas macro dedicadas.'),
(3, 'Razer Huntsman Elite ', 1, 89, 'O Razer BlackWidow sempre foi o padrão de excelência dos teclados para jogos. Agora, a Razer levou os seus componentes a um nível superior, com um Switch Mecânico Razer™ atualizado e o novo Seletor Digital Multifuncional. Conheça o Razer BlackWidow Elite. Projetado para ser o mais completo teclado mecânico para jogos em qualquer arena. Com o Razer Hypershift e a Memória Híbrida Integrada e na Nuvem, você agora pode transformar qualquer tecla numa tecla de macro e ativar as suas configurações preferidas em q'),
(4, 'Razer DeathAdder ', 2, 29, 'A Razer DeathAdder é, há mais de uma década, uma linha icónica de ratos para jogos na arena global de esports. Conquistou uma reputação de fiabilidade pela qual os gamers colocam a mão no fogo devido à sua durabilidade, conforto e ergonomia comprovados. Agora, a Razer está ainda a tornar mais acessível, com o mais recente membro da família – o Razer DeathAdder Essential.'),
(5, 'Steelseries Rival 5 ', 2, 59, 'Domine em qualquer jogo que você jogar. O Rival 5 é o rato para jogos de precisão mais versátil. Personalize os seus 9 botões programáveis para se adequar ao seu jogo, incluindo o botão de alternância de ação rápida personalizado que é construído para execuções de reação extremamente rápidas.'),
(6, ' Asus ROG Gladius III Wireless ', 2, 109, 'Rato gaming wireless assimétrico clássico com conectividade tri-mode (2,4 GHz / Bluetooth® / com fio), sensor de 19.000 dpi especialmente ajustado, latência de zero clique, exclusivo Push-Fit Switch Socket II, estética lateral ROG gravada a laser, solução de pareamento rápido Bluetooth e Iluminação Aura Sync RGB.'),
(7, ' Asus VG258QR TN 24.5', 3, 219, 'Concebido para jogos rápidos e intensos, o ASUS VG258QR é um ecrã para jogos Full HD de 24.5\" com um tempo de resposta ultrarrápido de 0.5ms e uma velocidade de atualização de 165Hz que lhe permite uma jogabilidade super suave. O VG258QR dispõe da tecnologia AMD Adaptive-Sync/FreeSync™ para eliminar manchas no ecrã e reproduções instáveis.'),
(8, 'BenQ EX3200R VA 31.5', 3, 315, 'A visualização de vídeos nunca teve tanta qualidade. Presenteie os seus olhos com o EX3200R da BenQ, um monitor curvo de entretenimento de 31,5 polegadas. Concebido para ter uma curva de 1800R para aumentar o seu campo de visão, em conjunto com o modo Cinema e o suporte Formato de vídeo, os amantes do cinema podem usufruir de uma melhor experiência cinematográfica.'),
(9, 'AOC G1 C27G1 VA 27', 3, 274, 'O C27G1 possui um painel VA com curvatura 1800R e sem moldura em Full HD, com um suporte ergonómico. Ele vem com taxa de atualização de 144 Hz, tecnologia FreeSync e 1 ms MPRT, além de vários recursos dedicados para gaming.'),
(10, 'Corsair HS 70', 4, 110, 'O Headset gamer CORSAIR HS70 PRO WIRELESS oferece tanto conforto quanto qualidade com auriculares em viscoelástico e drivers de áudio em neodímio de 50mm e ajuste personalizado, projetados para longa durabilidade graças à sua estrutura leve e resistente. Conecta-se ao seu PC ou PS4 com uma conexão sem fio de 2,4GHz de baixa latência, e tenha a garantia de que você será ouvido(a) com um microfone unidirecional completamente removível com cancelamento de ruídos. Mergulhe num som surround 7.1 no PC com até 16 '),
(11, 'HyperX Cloud II', 4, 110, 'O HyperX® Cloud II dispõe de um dispositivo de controlo avançado de áudio USB, com um design inovador que amplifica o áudio e a voz garantindo uma excelente experiência de jogo. Você poderá ouvir o que nem imagina. Entre num mundo que os outros gamers jamais conhecerão: ouça o ruído de botas sobre o piso ou as pás de uma ventoinha distante. O dispositivo independente que controla o volume do áudio e do microfone permite que você ajuste não apenas o volume do áudio, mas também o volume do microfone, além de '),
(12, 'ASTRO Gaming A10', 4, 59, 'Prepare-se para invadir o território inimigo sem piedade. Eleve o nível do seu equipamento com o Headset A10. Fabricação durável e conforto estendido para combater o cansaço significa que você pode jogar por mais tempo, jogar melhor e mostrar ao inimigo como se faz. “Desenvolvido para jogos\" com ASTRO Audio e apresentando drivers de 40 mm, para que você ouça os seus jogos e os seus colegas de jogo com clareza e precisão. Equilíbrio de jogo: voz, microfone unidirecional, controlo de volume em cabo e funciona'),
(13, 'Asus ROG Zephyrus G14 ', 5, 1400, 'O Zephyrus G14 é deslumbrante em Cinzento Eclipse. A sua estética limpa navega transita facilmente de LAN Parties para apresentações, com detalhes precisos que o colocam numa classe própria. O processo CNC cria 6536 perfurações na tampa de alumínio para criar um design distinto com uma matriz de pontos. Os reforços tipo favo de mel adicionam resistência com um mínimo de material necessário para manter o chassis leve. A plataforma em liga de alumínio-magnésio é resistente a impressões digitais para o manter '),
(14, 'Lenovo Legion 5 ', 5, 1300, 'Com um inúmeras opções de desempenho para qualquer jogador num design simples e minimalista, o Legion 5 de 15\" combina sólidos processadores da série AMD Ryzen 4000, uma placa gráfica NVIDIA® GeForce® e um  SSD, tudo equilibrado termicamente com o sistema Legion Coldfront 2.0. Desfrute de taxas de renovação ultrarrápidas num ecrã Full HD com 100% da precisão cromática, controlos rápidos e teclado TrueStrike para superar os adversários.\r\n'),
(15, 'Asus VivoBook ', 5, 600, 'O ASUS VivoBook 15 é a tua solução tudo-em-um para produtividade e entretenimento, oferecendo a performance que precisas para lidar facilmente com as tarefas diárias de computação, além de potência suficiente para edição de vídeo ou gaming. Um sistema de arrefecimento avançado também te garante que podes trabalhar ou jogar confortavelmente e com confiança no teu ecrã NanoEdge de 15.6\".\r\n'),
(16, 'BL-DR33DD1 ', 6, 399, 'Esta configuração apresenta um processador de 4 núcleos AMD Ryzen 3 Pro 4350G da arquitetura Zen 2, construído para empresas modernas. A tecnologia AMD PRO oferece camadas de proteção, gestão simplificada e longevidade fiável. Conta também com gráficos integrados AMD Radeon™ Graphics, 8GB de memória DDR4 e armazenamento rápido SSD. Lentidão será coisa do passado!\r\n'),
(17, 'GML-GI5109IC1 ', 6, 899, 'Esta configuração apresenta um processador de 6 núcleos Intel Core i5-10400F da arquitetura Comet Lake, para níveis incríveis de desempenho, tanto para gaming como para trabalho e lazer. Conta também com uma placa gráfica dedicada NVIDIA GeForce GTX 1660 SUPER da arquitetura NVIDIA Turing, 16GB de memória DDR4 e armazenamento rápido SSD. Lentidão será coisa do passado!\r\n'),
(18, 'GML-MR55SD1 ', 6, 1899, 'Esta configuração apresenta um processador de 6 núcleos AMD Ryzen 5 5600X da arquitetura Zen 3, para níveis incríveis de desempenho, tanto para gaming como para trabalho e lazer. Conta também com uma placa gráfica dedicada NVIDIA GeForce RTX 3070 da arquitetura NVIDIA Ampere, 16GB de memória DDR4 e armazenamento rápido SSD. Lentidão será coisa do passado!\r\n'),
(19, 'Logitech C505e HD 720p ', 7, 49, 'Dê um passo além das câmeras de laptop com a webcam profissional Logitech® C505e. Vídeos nítidos, suaves e coloridos em widescreen 720p HD por um preço acessível que torna a vida no escritório mais fácil. A C505e fornece um campo de visão diagonal de 60°, foco fixo e correção de luz automática que se ajusta à iluminação da maioria dos espaços, além de microfone omnidirecional que capta conversas com clareza em até 3 metros.\r\n'),
(20, 'Razer Kiyo Pro Full HD 1080p ', 7, 199, 'Atinja os padrões de vídeo profissional para streaming e videoconferência com o Razer Kiyo Pro - uma webcam FHD USB que possui um sensor de luz adaptável de alto desempenho, para que você possa desfrutar de uma qualidade nítida e clara em qualquer configuração e condição de iluminação.\r\n'),
(21, 'Asus C3 Full HD 1080p ', 7, 59, 'Câmara USB com gravação 1080p a 30 fps, microfone beamforming para melhor qualidade de áudio e vídeo ao vivo e clipe ajustável que se adapta a vários dispositivos.\r\n'),
(22, 'Thrustmaster Ferrari F1 Wheel Add-On ', 8, 168, 'O Add-On Wheel Thrustmaster Ferrari F1 oferece a melhor experiência de jogo para o seu PC, PS3 e PS4 e Xbox One. Uma réplica em tamanho real do volante de corrida F1 2011 da Ferrari, o volante preciso e autêntico oferece a simulação de condução ideal.Com os botões rotativos, interruptores e botões de ação de nível profissional, o F1 Add-On Wheel da Thrustmaster coloca-te no assento do motorista de um carro de corrida de Fórmula 1.\r\n'),
(23, 'Krom K-Wheel Multiplatform ', 8, 58, 'Krom K-Wheel é um volante e conjunto de pedais otimizado para todos os tipos de jogos de corrida, que surgiu para oferecer-lhe máxima segurança e controlo, mesmo nas manobras mais extremas. Experimente a adrenalina dos pilotos de corrida a partir do seu ecrã graças a esta configuração de condução completa.\r\n'),
(24, 'Thrustmaster T300 RS GT Edition ', 8, 360, 'O T300 RS GT Edition representa o mesmo valor que o famoso Ferrari 458 Challenge, que eles conhecem em circuitos de corrida em todo o mundo. É feito na escala 7:10. Esse desempenho e precisão, incluindo recursos que ajudarão os utilizadores a melhorar as suas habilidades de corrida e a interromper os seus intervalos. É por isso que a Thrustmaster se tornou no principal parceiro da Thrustmaster Virtual GP 2017. Este conjunto de volante e pedal, licenciado oficialmente pelo Gran Turismo, foi projetado para Pl'),
(25, 'Logitech Z130 Stereo 2.0 10W', 9, 30, 'Estas colunas estéreo oferecem som claro e fornecem graves extras à sua experiência de áudio. Aceda facilmente a todos os controlos na coluna direita.\r\n'),
(26, 'Logitech G560 Lightsync Gaming 2.1 240W ', 9, 170, 'Sinta a ação explosiva da potência de 240 Watts Peak (120 Watts RMS) alimentando o subwoofer down-firing e dois satélites com drivers metálicos leves e de alta resistência. Ouça todos os detalhes e soNS destinados a este sistema de som 2.1. E a partir de uma ampla gama de ângulos, graças ao design único do driver, proporciona uma enorme paisagem sonora.\r\n'),
(27, 'Trust Yuri 2.1 120W', 9, 170, 'Para um som rico e profundo, não precisa procurar além do conjunto de alto-falantes 2.1. Com potência de pico de 120 W e um forte driver de graves de 5,25 ”, este conjunto compacto de colunas de som para PC ou portátil cria impacto, proporcionando uma experiência de áudio equilibrada. Liberte-se do áudio incorporado do computador e atualize seu som para músicas, filmes e jogos.\r\n'),
(28, 'MSI GeForce RTX 3090 Gaming Trio 24G', 10, 2799, 'As placas gráficas GeForce RTX™ Série 30 oferecem o melhor desempenho para jogadores e criadores. Elas são alimentados por Ampere - a arquitetura RTX de 2ª geração da NVIDIA - com novos núcleos RT, núcleos Tensor e multiprocessadores de streaming para gráficos Ray Tracing mais realistas e recursos de AI de ponta.\r\n'),
(29, 'AMD Ryzen 9 5950X 16-Core 3.4GHz c/ Turbo 4.9GHz', 10, 899, 'Quando você tem a arquitetura de processador mais avançada do mundo para jogadores e criadores de conteúdo, as possibilidades são infinitas. Esteja você a jogar os jogos mais recentes, a projetar o próximo projeto ou a processador uma enorme quantidade de dados, você precisa de um processador poderoso que possa lidar com tudo - e muito mais. Sem dúvida, os processadores AMD Ryzen™ série 5000 definem o padrão para jogadores e artistas.\r\n'),
(30, 'Mini-ITX Asus ROG Crosshair VIII Impact', 10, 409, 'A série ROG Crosshair VIII anuncia a chegada da Impact, a motherboard compacta com potencial colossal. Preparada para a 3ª geração de CPUs AMD Ryzen, a Crosshair VIII Impact Mini-DTX vem com inúmeras funções ATX, incluindo fornecimento de energia avançado e arrefecimento, duas M.2, Wi-Fi 6 (802.11ax) da próxima geração e áudio SupremeFX incorporado. É a escolha perfeita para a tua plataforma de dimensão física pequena, preparada para rivalizar com as construções de tamanho superior.\r\n');

-- --------------------------------------------------------

--
-- Estrutura da tabela `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `produtoId` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `stock`
--

INSERT INTO `stock` (`id`, `produtoId`, `quantidade`) VALUES
(1, 1, 30),
(2, 2, 13),
(3, 3, 39),
(4, 4, 10),
(5, 5, 55),
(6, 6, 24),
(7, 7, 78),
(8, 8, 62),
(9, 9, 45),
(10, 10, 31),
(11, 11, 44),
(12, 12, 29),
(13, 13, 66),
(14, 14, 32),
(15, 15, 77),
(16, 16, 12),
(17, 17, 9),
(18, 18, 58),
(19, 19, 46),
(20, 20, 32),
(21, 21, 10),
(22, 22, 34),
(23, 23, 33),
(24, 24, 77),
(25, 25, 32),
(26, 26, 11),
(27, 27, 2),
(28, 28, 21),
(29, 29, 17),
(30, 30, 44);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categoriaproduto`
--
ALTER TABLE `categoriaproduto`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `clienteencomenda`
--
ALTER TABLE `clienteencomenda`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `encomenda`
--
ALTER TABLE `encomenda`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `encomendaproduto`
--
ALTER TABLE `encomendaproduto`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `categoriaproduto`
--
ALTER TABLE `categoriaproduto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `clienteencomenda`
--
ALTER TABLE `clienteencomenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `encomenda`
--
ALTER TABLE `encomenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `encomendaproduto`
--
ALTER TABLE `encomendaproduto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
