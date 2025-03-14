package com.agenda.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.agenda.model.Pessoa;
import com.agenda.util.ConnectionFactory;

public class PessoaDAO {

	private EnderecoDAO enderecoDao;
	private ContatoDAO contatoDao;

	public PessoaDAO() {
		this.enderecoDao = new EnderecoDAO();
		this.contatoDao = new ContatoDAO();
	}

	private Connection connection;

	public void cadastrar(Pessoa pessoa) {

		pessoa.setEndereco(this.enderecoDao.cadastrar(pessoa.getEndereco()));
		pessoa.setContato(this.contatoDao.cadastrar(pessoa.getContato()));

		String SQL = "insert into pessoas (nome, data_nascimento, id_endereco, id_contato ) values (?, ?, ?, ?)";

		try {

			this.connection = new ConnectionFactory().getConnection();
			PreparedStatement stmt = this.connection.prepareStatement(SQL);

			stmt.setString(1, pessoa.getNome());
			stmt.setDate(2, new Date(pessoa.getDataNascimento().getTimeInMillis()));
			stmt.setLong(3, pessoa.getEndereco().getId());
			stmt.setLong(4, pessoa.getContato().getId());

			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public List<Pessoa> buscarPessoas() {

		String SQL = "select * from pessoas";

		try {

			this.connection = new ConnectionFactory().getConnection();
			PreparedStatement stmt = this.connection.prepareStatement(SQL);

			List<Pessoa> pessoas = new ArrayList<Pessoa>();

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Pessoa pessoa = new Pessoa();
				pessoa.setId(rs.getLong("id"));
				pessoa.setNome(rs.getString("nome"));
				Calendar data = Calendar.getInstance();
				data.setTime(rs.getDate("data_nascimento"));
				pessoa.setDataNascimento(data);
				pessoa.setEndereco(this.enderecoDao.buscarPorId(rs.getLong("id_endereco")));
				pessoas.add(pessoa);
			}

			stmt.close();
			this.connection.close();
			return pessoas;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	public void remover(Pessoa pessoa) {

		String SQL = "delete from pessoas where id=?";

		try {
			this.connection = new ConnectionFactory().getConnection();
			PreparedStatement stmt = connection.prepareStatement(SQL);
			stmt.setLong(1, pessoa.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void alterar(Pessoa pessoa) {

		String SQL = "update pessoas set nome=?, email=?, endereco=?, telefone=? where id=?";

		try {

			this.connection = new ConnectionFactory().getConnection();
			PreparedStatement stmt = this.connection.prepareStatement(SQL);

			stmt.setString(1, pessoa.getNome());
			stmt.setLong(5, pessoa.getId());
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
